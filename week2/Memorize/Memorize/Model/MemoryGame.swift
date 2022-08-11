//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import Foundation

struct MemoryGame<CardContent> {
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var isFaceUpBefore = false
        var content: String
        var id: Int
    }
    let theme: Theme
    var cards: [Card]
    var point: Int
    var countOfCurrentOpenedCard: Int
    var indexOfAlreadySelectedCard: Int
    let numberOfCardPair: Int
    
    //NewMemoryGame 생성
    init(theme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        self.theme = theme;
        self.point = 0
        self.cards = cards.shuffled()
        countOfCurrentOpenedCard = 0
        indexOfAlreadySelectedCard = 0
        
        numberOfCardPair = self.theme.randomNumberOfCardPair
        
        
        let _ = print(theme.Emojis)
        
        for pairIndex in 0 ..< numberOfCardPair {
            
            let testLog = print("testLog :  \(numberOfCardPair)")
            
            let content = self.theme.Emojis[pairIndex]
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards.shuffle()
    }
    
    //나중에 filtter 사용해서 구현해보기
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }) {
            if cards[chosenIndex].isMatched {
                return
            }
            if cards[chosenIndex].isFaceUpBefore {
                print("cards[chosenIndex].isFaceUpBefore : \(cards[chosenIndex].isFaceUpBefore)")
                print("point #before# : \(self.point)")
                self.point -= 1
                print("point #after# : \(self.point)")
            }
            cards[chosenIndex].isFaceUpBefore = true
            //보드에서 처음 카드를 선택하는 경우
            if countOfCurrentOpenedCard == 0 {
                cards[chosenIndex].isFaceUp.toggle()
                indexOfAlreadySelectedCard = chosenIndex
                countOfCurrentOpenedCard += 1
            }
            //보드에서 두 번째 카드를 선택하는 경우(이미 한 장의 카드가 선택된 경우)
            else if countOfCurrentOpenedCard == 1 {
                cards[chosenIndex].isFaceUp.toggle()
                countOfCurrentOpenedCard = 0
                //첫 번째 선택한 카드와 두 번째 선택한 카드가 같은 경우
                if cards[chosenIndex].content == cards[indexOfAlreadySelectedCard].content && chosenIndex != indexOfAlreadySelectedCard {
                    let testLog123 = print("1 : \(cards[chosenIndex].content)")
                    let testLog1234 = print("2 : \(cards[indexOfAlreadySelectedCard].content)")
                    self.point += 2
                    cards[chosenIndex].isMatched = true
                    cards[indexOfAlreadySelectedCard].isMatched = true
                }
                //첫 번째 선택한 카드와 두 번째 선택한 카드가 다른 경우
                else {
                    cards[chosenIndex].isFaceUp.toggle()
                    cards[indexOfAlreadySelectedCard].isFaceUp.toggle()
                }
            }
        }
        print("point : \(self.point)")
    }

    
    
}
