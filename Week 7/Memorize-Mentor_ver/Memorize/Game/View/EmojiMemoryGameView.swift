//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    @Namespace private var dealingNamespace
    @State private var dealt: Set<Int> = []
    
    var body: some View {
        ZStack {
            VStack {
                if game.isFinished {
                    Spacer()
                    gameResult
                } else {
                    gameBody
                }
                Spacer()
                bottomControls
            }
            VStack {
                Spacer()
                deckBody
            }
        }
        .foregroundColor(game.themeColor)
        .padding()
    }
    
    // MARK: SubView(s)
    
    var gameBody: some View {
        VStack {
            ZStack {
                title
                HStack {
                    Spacer()
                    point
                }
            }
            gameBoard
        }
    }
    
    var title: some View {
        Text(game.themeName).font(.largeTitle)
    }
    
    var point: some View {
        Text(Texts.pointDescription + game.points).font(.body)
    }
    
    var gameBoard: some View {
        AspectVGrid(items: game.cards, aspectRatio: DrawingConstants.cardAspectRatio) { card in
            if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
                Color.clear
            } else {
                EmojiCardView(card: card)
                    .padding(DrawingConstants.cardPadding)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .scale))
                    .zIndex(zIndex(of: card))
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                    }
            }
        }
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                EmojiCardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .opacity, removal: .identity))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: DrawingConstants.undealtWidth, height: DrawingConstants.undealtHeight)
        .onTapGesture {
            for card in game.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    var gameResult: some View {
        Text(Texts.gameResultPrefix + game.points + Texts.gameResultSuffix)
            .multilineTextAlignment(.center)
            .font(.title)
    }
    
    var bottomControls: some View {
        HStack {
            newGameButton
            Spacer()
            shuffleCardsButton
        }
    }
    
    var newGameButton: some View {
        Button {
            withAnimation {
                dealt.removeAll()
                game.createNewGame()
            }
        } label: {
            Text(Texts.newGame)
        }
    }
    
    var shuffleCardsButton: some View {
        Button {
            withAnimation {
                game.shuffleCards()
            }
        } label: {
            Text(Texts.shuffle)
        }
    }
    
    // MARK: Method(s)
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        dealt.contains(card.id) == false
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        if let index = game.cards.index(matching: card) {
            delay = Double(index) * (AnimationConstants.totalDealDuration / Double(game.cards.count))
        }
        return Animation.easeInOut(duration: AnimationConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
        -Double(game.cards.index(matching: card) ?? 0)
    }
}

// MARK: - Constant(s)

extension EmojiMemoryGameView {
    
    private enum Texts {
        
        static let pointDescription = "Points: "
        static let gameResultPrefix = "Well Done !!\nYou got "
        static let gameResultSuffix = " Point(s) !!"
        static let newGame = "New Game"
        static let shuffle = "Shuffle"
    }
    
    private enum DrawingConstants {
        
        static let cardAspectRatio: CGFloat = 2 / 3
        static let cardPadding: CGFloat = 4
        
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * cardAspectRatio
    }
    
    private enum AnimationConstants {
        
        static let dealDuration = 0.5
        static let totalDealDuration = 2.0
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
