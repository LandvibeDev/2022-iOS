//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/02.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var isFaceUpBefore = false
        var content: CardContent
        var id: Int
    }
    var cards: [Card]
    var selectedCardsIndex: [Int]
    var point: Int
    var countOfCurrentOpenedCard: Int
    var alreadySelectedIndex: Int
    let numberOfCardPair: Int
    
    //NewMemoryGame 생성
    init(theme: Theme, createContent: (Int) -> CardContent) {
        cards = [Card]()
        self.point = 0
        self.cards = cards.shuffled()
        countOfCurrentOpenedCard = 0
        alreadySelectedIndex = 0
        selectedCardsIndex = []
        
        self.numberOfCardPair = theme.numberOfCardPair
        
        let _ = print(theme.Emojis)
        
        for pairIndex in 0 ..< numberOfCardPair {
            
            //            let testLog = print("testLog :  \(numberOfCardPair)")
            
            let content = createContent(pairIndex)
            cards.append(Card(content: content, id: 2 * pairIndex))
            cards.append(Card(content: content, id: 2 * pairIndex + 1))
        }
        cards.shuffle()
    }
    
    //나중에 filtter 사용해서 구현해보기
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }) {
            
            //이미 매치되어 뒤집혀진 카드를 골랐을 경우 무시
            if cards[chosenIndex].isMatched {
                return
            }
            
            //카드를 2장 고르기 전 이미 골라져있는 카드를 다시 고르면 무시
            if selectedCardsIndex.contains(chosenIndex) {
                return
            }
            
            cards[chosenIndex].isFaceUp = true
            selectedCardsIndex.append(chosenIndex)
            
            //현재 고른 카드가 전에 골랐던 카드라면 -1점
            if cards[chosenIndex].isFaceUpBefore {
                self.point -= 1
            }
            cards[chosenIndex].isFaceUpBefore = true
            
            if selectedCardsIndex.count > 2 {
                cards[selectedCardsIndex[0]].isFaceUp = false
                cards[selectedCardsIndex[1]].isFaceUp = false
                if cards[selectedCardsIndex[0]].content == cards[selectedCardsIndex[1]].content {
                    self.point += 2
                    cards[selectedCardsIndex[0]].isMatched = true
                    cards[selectedCardsIndex[1]].isMatched = true
                }
                selectedCardsIndex.removeAll()
                selectedCardsIndex.append(chosenIndex)
            }
            print("point : \(self.point)")
        }
    }
    
    func gameOver() -> Bool {
        print (cards)
        for index in 0..<cards.count {
            if !cards[index].isMatched {
                return false
            }
        }
        return true
    }
    
    
    
}
