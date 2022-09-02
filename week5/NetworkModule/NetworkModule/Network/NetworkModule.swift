//
//  NetworkModule.swift
//  NetworkModule
//
//  Created by changgyo seo on 2022/08/29.
//

import Foundation

struct NetworkModule {
    
    static let shared = NetworkModule()
    
    /// fetchData는 원하는 종류의 엔티티를 제네릭의 입력후 필요한 prameter를 입력하면 됩니다.
    ///
    /// - Parameters:
    ///   - method: HttpMethod라는 열거형이거, get, put, post, delete를 지원합니다.
    ///   - url: url은 string 형태로 파라미터를 제거한 형태의 url을 입력하면 됩니다.
    ///   - entity: 원하는 reposne의 모델  그 중 naver의 경우 items의 타입을 기입하면 해당되는 모델로 클로저의 파라미터를 통해 방출합니다.
    ///   - paramaters: 원하는 파라미터를 넣으면 됩니다. 이때. value는 반드시 string protocol을 따라야합니다.
    ///   - header: 토큰이나 필수 요소를 파라미터와 같은 형태로 넣으면 됩니다.
    ///   - completion: 제네릭의 넣은 모델을 바탕으로 결과값을 보내줍니다.
    func fetchData<EntityType: Decodable>(_ url: String, entity: EntityType.Type, httpMethod: HttpMethod, paramaters: [String: String]? = nil, header: [String: String]? = nil,completion: @escaping (NetworkResult<EntityType>?) -> Void) {
        
        var urlComponent = URLComponents(string: url)
        var queryItems = [URLQueryItem]()
        paramaters?.forEach { key, value in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponent?.queryItems = queryItems
        
        guard let url = urlComponent?.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        header?.forEach { key, value in
            
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, urlResponse, error in
            
            guard error == nil,
                  let httpURLResponse = urlResponse as? HTTPURLResponse,
                  let data = data else { return }
            
            var networkResult: NetworkResult<EntityType>?
            let decoder = JSONDecoder()
            guard let reponseData = try? decoder.decode(EntityType.self, from: data)
            else { return }
            
            switch httpURLResponse.statusCode {
               
            case (200 ..< 300):
                networkResult = .success(reponseData)
            case (400 ..< 500):
                networkResult = .clientError
            case (300 ..< 400):
                networkResult = .serverError
            default:
                networkResult = .error
            }
            
            completion(networkResult)
        }).resume()
    }
    
    func makeParameter<Parameter: RequestEnum>(_ parameters: [Parameter]) -> [String: String] {
        
        var urlParameters = [String: String]()
        parameters.forEach { parameter in
            urlParameters.updateValue(parameter.valueText, forKey: parameter.keyText)
        }
        
        return urlParameters
    }
}

extension NetworkModule {
    
    enum NetworkResult<T> {
        
        case success(T)
        case serverError
        case clientError
        case error
    }
}

protocol RequestEnum {
    
    var keyText: String { get }
    var valueText: String { get }
}

enum HttpMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
