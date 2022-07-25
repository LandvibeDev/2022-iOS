

import SwiftUI
import Foundation
import Combine

class MemorizeCardGameManger: ObservableObject{
    
    @Published var currentTheme: ThemeInfo = .country
    @Published var currentCardNumber: Int = 0
    @Published var powerOfImageList: [ImageAndText] = [ImageAndText]()
    
    init(){
        self.powerOfImageList = self.currentTheme.powerOfImageList
    }
   
    func changeTheme(_ theme: ThemeInfo){
        currentTheme = theme
        powerOfImageList = currentTheme.powerOfImageList
        powerOfImageList.shuffle()
        
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
    
    func emitCard() -> [ImageAndText] {
        var emitCardList = [ImageAndText]()
        powerOfImageList.enumerated().forEach{ idx, element in
            if( idx < currentCardNumber){
                emitCardList.append(element)
            }
        }
        return emitCardList
    }

}
