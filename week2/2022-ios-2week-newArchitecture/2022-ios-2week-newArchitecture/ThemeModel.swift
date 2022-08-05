
import SwiftUI

struct ThemeModel {
    private(set) var current: Detail
    private(set) var content: [String]
    private(set) var displayCardCount: Int
    
    init(){
        current = .face
        content = ConstantImojiContent.emitImoji(willChangeTheme: current)
        displayCardCount = content.count
    }
    
    mutating func changeTheme() -> Detail{
        print("sdsdsd")
        current = Detail.allCases.randomElement() ?? .face
        content = ConstantImojiContent.emitImoji(willChangeTheme: current)
        displayCardCount = Int.random(in: 1...1000) % content.count
        
        return current
    }

    enum Detail: CaseIterable {
        case face //defalut
        case animal
        case sports
        case vehicle
        case heart
        case outfit
        
        var name: String {
            switch self {
            case .face:
                return "Face"
            case .animal:
                return "Animal"
            case .sports:
                return "Sports"
            case .vehicle:
                return "vehicle"
            case .heart:
                return "Heart"
            case .outfit:
                return "OutFit"
            }
        }
        
        var color: Color {
            switch self {
            case .face:
                return .blue
            case .animal:
                return .red
            case .sports:
                return .green
            case .vehicle:
                return .gray
            case .heart:
                return .yellow
            case .outfit:
                return .cyan
            }
        }
    }
}



