import SwiftUI

class MemorizeCardGameManger: ObservableObject{
    
    static var themeList: [ThemeInfo] = [.country, .emotion, .food]
    
    @Published var currentTheme: ThemeInfo = .country {
        didSet {
            powerOfImageList = currentTheme.powerOfImageList
            powerOfImageList.shuffle()
            
            if currentCardCount > currentTheme.maxCardCount {
                currentCardCount = currentTheme.maxCardCount
            }
        }
    }
    @Published var currentCardCount: Int = 0
    @Published var powerOfImageList: [ImageAndText] = [ImageAndText]()
    
    init(){
        self.powerOfImageList = self.currentTheme.powerOfImageList
    }
    
    func plusCard(_ num: Int = 1){
        if currentCardCount < currentTheme.maxCardCount{
            currentCardCount += num
        }
    }
    
    func minusCard(_ num: Int = 1) {
        let newValue = num * -1
        if currentCardCount >= 1 {
            currentCardCount += newValue
        }
    }
    
    func emitCard() -> [ImageAndText] {
        var emitCardList = [ImageAndText]()
        powerOfImageList.enumerated().forEach{ idx, element in
            if( idx < currentCardCount){
                emitCardList.append(element)
            }
        }
        return emitCardList
    }
}
