//
//  NetworkModule.swift
//  NetworkModule
//
//  Created by changgyo seo on 2022/08/29.
//

import Foundation

struct NetworkModuleAlamofireStyle {
    
    private init() {}
    
    static let shared = NetworkModuleAlamofireStyle()
    
    var defaultHeadr = [String: String]()
    
    /// fetchData는 원하는 종류의 엔티티를 제네릭의 입력후 필요한 prameter를 입력하면 됩니다.
    ///
    /// - Parameters:
    ///   - method: HttpMethod라는 열거형이거, get, put, post, delete를 지원합니다.
    ///   - url: url은 string 형태로 파라미터를 제거한 형태의 url을 입력하면 됩니다.
    ///   - entity: 원하는 reposne의 모델  그 중 naver의 경우 items의 타입을 기입하면 해당되는 모델로 클로저의 파라미터를 통해 방출합니다.
    ///   - paramaters: 원하는 파라미터를 넣으면 됩니다. 이때. value는 반드시 string protocol을 따라야합니다.
    ///   - header: 토큰이나 필수 요소를 파라미터와 같은 형태로 넣으면 됩니다.
    ///   - completion: 제네릭의 넣은 모델을 바탕으로 결과값을 보내줍니다.
    func fetchData<EntityType: Codable>(_ url: String,
                                        entity: EntityType.Type,
                                        httpMethod: HttpMethod,
                                        paramaters: [String: String]? = nil,
                                        header: [String: String]? = nil,
                                        completion: @escaping (NetworkResult<EntityType>?) -> Void) {
        
        var urlComponent = URLComponents(string: url)
        var urlRequest = URLRequest(url: URL(string: url)!)
        
        switch httpMethod {
        case .get:
            var queryItems = [URLQueryItem]()
            paramaters?.forEach { key, value in
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            urlComponent?.queryItems = queryItems
            urlRequest.url = urlComponent!.url
        case .post, .put, .delete:
            guard let paramaters = paramaters else { return }
            let paramData = try! JSONSerialization.data(withJSONObject: paramaters, options: [])
            urlRequest.url = URL(string: url)
            urlRequest.httpBody = paramData
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        }
        
        urlRequest.httpMethod = httpMethod.rawValue
        header?.forEach { urlRequest.addValue($1, forHTTPHeaderField: $0) }

       //guard let urlRequest = urlRequest else { return }
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, urlResponse, error in
            
            guard error == nil else {
                completion(.error)
                return
            }
            
            guard let httpURLResponse = urlResponse as? HTTPURLResponse,
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

extension NetworkModuleAlamofireStyle {
    
    enum NetworkResult<T> {
        
        case success(T)
        case serverError
        case clientError
        case error
    }
    
    struct FetchParameter<T: Codable> {
        
        var url: String
        var entity: T
        var httpMethod: HttpMethod
        var parameters: [String: String]?
        var header: [String: String]?
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
