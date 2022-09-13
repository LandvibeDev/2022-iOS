//
//  Fetchable.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/09/01.
//

import Combine
import Foundation

enum Scheme: String {
    
    case https
}

enum Host: String {
    
    case naverOpenAPI = "openapi.naver.com"
}

enum HTTPMethod: String {
    
    case get
    case post
}

enum FetchStatus {
    
    case idle
    case fetching
}

protocol Fetchable {
    
    var scheme: Scheme { get }
    var host: Host { get }
    var session: URLSession { get }
    
    func generateURLRequest<P: FetchableParameter>(with parameter: P) -> URLRequest?
    func fetch<P: FetchableParameter, R: Decodable>(with parameter: P) -> AnyPublisher<R, Error>
}

extension Fetchable {
    
    func generateURLRequest<P: FetchableParameter>(with parameter: P) -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host.rawValue
        urlComponents.path = parameter.path
        if parameter.httpMethod == .get,
           let data = parameter.data,
           let dictionary = data.stringDictionary {
            urlComponents.queryItems = dictionary.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = urlComponents.url
        else { return nil }
        
        var urlRequest = URLRequest(url: url)
        if let headers = parameter.headers {
            headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        }
        urlRequest.httpMethod = parameter.httpMethod.rawValue.uppercased()
        if parameter.httpMethod == .post, let data = parameter.data {
            urlRequest.httpBody = data.encodedJSONData
        }
        return urlRequest
    }
    
    func fetch<P: FetchableParameter, R: Decodable>(with parameter: P) -> AnyPublisher<R, Error> {
        guard let urlRequest = generateURLRequest(with: parameter)
        else { return Fail(error: CustomError.url).eraseToAnyPublisher() }
        return session.dataTaskPublisher(for: urlRequest)
            .mapError({ _ in CustomError.connectionFail })
            .flatMap({ output in
                Just(output)
                    .tryMap({ data, response in
                        guard let response = response as? HTTPURLResponse
                        else { throw CustomError.badRequest }
                        switch response.statusCode {
                        case 200 ... 299: return data
                        case 400 ... 499: throw CustomError.badRequest
                        case 500 ... 599: throw CustomError.internalServer
                        default: throw CustomError.unknown
                        }
                    })
                    .decode(type: R.self, decoder: JSONDecoder())
            })
            .eraseToAnyPublisher()
    }
}

protocol FetchableParameter {
    
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var data: Encodable? { get }
    var headers: [String: String]? { get }
}

extension FetchableParameter {
    
    var data: Encodable? { nil }
    var headers: [String: String]? { nil }
}
