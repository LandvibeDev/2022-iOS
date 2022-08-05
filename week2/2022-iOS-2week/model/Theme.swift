
import SwiftUI

struct Theme {
    private(set) var current: KindOf = .face
    private(set) var content = [String]()
    private(set) var displayCardCount = Int()
        
    mutating func changeTheme() {
        current = KindOf.allCases.randomElement() ?? .face
        content = ConstantImojiContent.emitImoji(willChangeTheme: current)
        displayCardCount = Int.random(in: 1...1000) % content.count
    }
}

// MARK: - extension Nested Struct
extension Theme {
    enum KindOf: CaseIterable {
        case face 
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

