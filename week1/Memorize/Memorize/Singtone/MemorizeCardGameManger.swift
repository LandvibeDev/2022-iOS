

import SwiftUI
import Foundation
import Combine

class MemorizeCardGameManger: ObservableObject{
    
    @Published var currentTheme: ThemeInfo = .country
    @Published var currentCardNumber: Int = 0
    
    func changeTheme(_ theme: ThemeInfo){
        if currentTheme == theme {
            return
        }

        currentTheme = theme
        if currentCardNumber > currentTheme.maxCardNumber {
            currentCardNumber = currentTheme.maxCardNumber
        }
    }

    func addOrSubtractCard(oneOrMinusOne num: Int) {
        if num == -1 && currentCardNumber >= 1 {
            currentCardNumber += -1
        }
        else if num == 1 &&  currentCardNumber < currentTheme.maxCardNumber{
            currentCardNumber += 1
        }
    }

}
