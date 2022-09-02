//
//  MovieFinder.swift
//  NetworkModule
//
//  Created by changgyo seo on 2022/08/30.
//

import UIKit

class Finder: ObservableObject {
    
    @Published var movieList: [Movie]?
    @Published var testResult: UIImage = UIImage(named: "tempImage")!
    
    func fetchMovieList(parameterList: [Movie.Request]) {
        
        NetworkModule.shared.fetchData(NaverOpenAPI.movieJsonURL,
                                       entity: NaverOpneAPICommonResponse<Movie>.self,
                                       httpMethod: .get,
                                       paramaters: NetworkModule.shared.makeParameter(parameterList),
                                       header: NaverOpenAPI.header) { [weak self] response in
            
            guard let self = self,
                  let response = response else { return }

            switch response {
                
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    print(data)
                    guard let self = self else { return }
                    self.movieList = data.items
                    guard let data = try? Data(contentsOf: URL(string: data.items.first?.image ?? "")!),
                          let image = UIImage(data: data) else { return }
                    self.testResult = image
                }
            case .serverError:
                print("server error")
            case .clientError:
                print("client error")
            case .error:
                print("unknown error")
            }
        }
    }
}

