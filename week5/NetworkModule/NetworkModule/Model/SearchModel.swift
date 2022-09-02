//
//  SearchModel.swift
//  NetworkModule
//
//  Created by changgyo seo on 2022/08/30.
//

struct Movie: Codable {
    
    let title: String
    let link: String
    let image: String
    let subtitle: String
    let pubDate: String
    let director: String
    let actor: String
    let userRating: String
    
    enum Request: RequestEnum {
        
        case query(String)
        case display(Int)
        case start(Int)
        case genre(String)
        case country(String)
        case yearFrom(Int)
        case yearTo(Int)
        
        var keyText: String {
            
            switch self {
                
            case .query:
                return "query"
            case .display:
                return "display"
            case .start:
                return "start"
            case .genre:
                return "genre"
            case .country:
                return "country"
            case .yearFrom:
                return "yearFrom"
            case .yearTo:
                return "yearTo"
            }
        }
        
        var valueText: String {
            
            switch self {
                
            case .query(let value):
                return value
            case .display(let value):
                return String(value)
            case .start(let value):
                return String(value)
            case .genre(let value):
                return value
            case .country(let value):
                return value
            case .yearFrom(let value):
                return String(value)
            case .yearTo(let value):
                return String(value)
            }
            
        }
    }

}
