//
//  SearchForm.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/09/05.
//

import Foundation

struct SearchForm {
    
    var keyword = ""
    var correction = ""
    var genre = Genre.none
    var isProceedable = false
    
    // MARK: Initializer(s)
    
    init(keyword: String = "", correction: String = "", genre: Genre = .none, isProceedable: Bool = false) {
        self.keyword = keyword
        self.correction = correction
        self.genre = genre
        self.isProceedable = isProceedable
    }
    
    // MARK: Logic Method(s)
    
    mutating func handleTypo() {
        keyword = correction
        correction.removeAll()
    }
}

// MARK: - Genre

extension SearchForm {
    
    enum Genre: String, CaseIterable, Identifiable {
        
        case none
        case all
        case drama
        case fantasy
        case horror
        case romance
        case adventure
        case thriller
        case documentary
        case comedy
        case animation
        case sf
        case action
        
        var id: Self { self }
        
        var code: String? {
            switch self {
            case .none, .all: return nil
            case .drama: return "1"
            case .fantasy: return "2"
            case .horror: return "4"
            case .romance: return "5"
            case .adventure: return "6"
            case .thriller: return "7"
            case .documentary: return "10"
            case .comedy: return "11"
            case .animation: return "15"
            case .sf: return "18"
            case .action: return "19"
            }
        }
    }
}
