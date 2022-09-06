//
//  NetworkModulMoyaStyle.swift
//  NetworkModule
//
//  Created by changgyo seo on 2022/09/06.
//
import Foundation

protocol RequestType {
    
    var url: String { get }
    var method: HttpMethod { get }
    var entity: Any { get }
    var parameters: Parameters? { get }
    var header: [String: String]? { get }
}

enum MovieAPI: RequestType {
    
    case movieRequest(parameters: [String: String]?)
    
    var url: String {
        switch self {
        case .movieRequest:
            return NaverOpenAPI.movieJsonURL
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .movieRequest:
            return .get
        }
    }
    
    var entity: Any {
        switch self {
        case .movieRequest:
            return NaverOpneAPICommonResponse<Movie>.self
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .movieRequest(let parameters):
            return .urlString(parameters ?? [:])
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .movieRequest:
            return NaverOpenAPI.header
        }
    }
}

enum Parameters {
    case urlString([String: String])
    case bodyString([String: String])
}

struct NetworkHost<requestAPI: RequestType> {
    
    func request(_ request: requestAPI, completion: @escaping () -> Void) {
        
        let t = String.self
        let k = type
        var urlComponent = URLComponents(string: request.url)
        var urlRequest = URLRequest(url: URL(string: request.url)!)
        
        
        switch request.parameters {
        case .urlString(let parameters):
            var queryItems = [URLQueryItem]()
            parameters.forEach { key, value in
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            urlComponent?.queryItems = queryItems
            urlRequest.url = urlComponent!.url
            
        case .bodyString(let parameters):
            let paramData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            urlRequest.url = URL(string: request.url)
            urlRequest.httpBody = paramData
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        case .none:
            break;
        }
        
        urlRequest.httpMethod = request.method.rawValue
        request.header?.forEach { urlRequest.addValue($1, forHTTPHeaderField: $0) }

       //guard let urlRequest = urlRequest else { return }
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, urlResponse, error in
            
            guard error == nil else {
                completion()
                return
            }
            
            guard let httpURLResponse = urlResponse as? HTTPURLResponse,
                  let data = data else { return }
            
            var networkResult = type(of: request.entity)
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

    
}

extension NetworkHost {
    
    enum NetworkResult<T> {
        
        case success(T)
        case serverError
        case clientError
        case error
    }
}
