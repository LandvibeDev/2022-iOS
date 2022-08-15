//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Byeongjo Koo on 2022/07/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            if game.isFinished {
                Spacer()
                gameResult
            } else {
                ZStack {
                    title
                    HStack {
                        Spacer()
                        point
                    }
                }
                gameBoard
            }
            Spacer()
            newGameButton
        }
        .foregroundColor(game.themeColor)
        .padding()
    }
    
    // MARK: SubView(s)
    
    var title: some View {
        Text(game.themeName).font(.largeTitle)
    }
    var point: some View {
        Text(Texts.pointDescription + game.points).font(.body)
    }
    var gameBoard: some View {
        AspectVGrid(items: game.cards, aspectRatio: DrawingConstants.aspectRatio) { card in
            if card.isMatched, !card.isFaceUp {
                Color.clear
            } else {
                EmojiCardView(card: card)
                    .padding(DrawingConstants.cardPadding)
                    .onTapGesture { game.choose(card) }
            }
        }
    }
    var gameResult: some View {
        Text(Texts.gameResultPrefix + game.points + Texts.gameResultSuffix)
            .multilineTextAlignment(.center)
            .font(.title)
    }
    var newGameButton: some View {
        Button {
            game.createNewGame()
        } label: {
            Text(Texts.newGame)
        }
    }
}

// MARK: - Constant(s)

extension EmojiMemoryGameView {
    
    private enum Texts {
        
        static let pointDescription = "Points: "
        static let gameResultPrefix = "Well Done !!\nYou got "
        static let gameResultSuffix = " Point(s) !!"
        static let newGame = "New Game"
    }
    
    private enum DrawingConstants {
        
        static let aspectRatio: CGFloat = 2 / 3
        static let cardPadding: CGFloat = 4
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
