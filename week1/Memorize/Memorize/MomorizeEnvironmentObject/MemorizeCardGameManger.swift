
import Foundation

class MemorizeCardGameManger: ObservableObject {
    
    static var themeList: [ThemeInfo] = ThemeInfo.allCases
    
    @Published var currentTheme: ThemeInfo = .country() {
        didSet {
            doubleImageList = currentTheme.doubleImageList
            doubleImageList.shuffle()
            
            if currentCardCount > currentTheme.maxCardCount {
                currentCardCount = currentTheme.maxCardCount
            }
        }
    }
    @Published var currentCardCount: Int = 0
    @Published var doubleImageList: [CardInfo] = [CardInfo]()
    
    init(){
        self.doubleImageList = self.currentTheme.doubleImageList
    }
    
    func cardCountChangeByMode(RawValue num: Int) {
        if num < 0 && currentCardCount >= 1 {
            currentCardCount += num
        }
        else if num > 0 && currentCardCount < currentTheme.maxCardCount{
            currentCardCount += num
        }
    }
    
    func emitCard() -> [CardInfo] {
        var emitCardList = [CardInfo]()
        doubleImageList.enumerated().forEach { index, element in
            if index < currentCardCount {
                emitCardList.append(element)
            }
        }
        return emitCardList
    }
}
