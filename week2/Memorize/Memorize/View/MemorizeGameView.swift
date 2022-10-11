//
//  Cardify.swift
//  Memorize
//
//  Created by ohhyeongseok on 2022/09/28.

import SwiftUI

struct MemorizeGameView: View {
    @EnvironmentObject var memorizeGameDealer: MemorizeGameDealer
    @Namespace private var dealingNamespace
    @State var dealt = Set<Int>()
    
    var body: some View {
        if memorizeGameDealer.isFinished {
            VStack {
                SuccessView(score: memorizeGameDealer.score)
                Spacer()
                newGameButton
            }
            .foregroundColor(memorizeGameDealer.themeColor)
        } else {
            VStack {
                VStack {
                    HStack {
                        themeName
                        Spacer()
                        score
                    }
                    cardList
                    Spacer()
                }
                .padding()
                HStack {
                    newGameButton
                    deckBody
                    shuffleButton
                }
            }
            .foregroundColor(memorizeGameDealer.themeColor)
        }
    }
    
    // MARK: SubView(s)
    
    var newGameButton: some View {
        Button(Texts.newGame) {
            withAnimation(Animation.easeInOut(duration: AnimationConstants.dealDuration)) {
                dealt.removeAll()
                memorizeGameDealer.newGame()
            }
        }
        .padding(DrawingConstants.padding)
    }
    
    var score: some View {
        Text("Score:\(memorizeGameDealer.score)").font(.title)
            .padding(DrawingConstants.padding)
    }
    
    var themeName: some View {
        Text(memorizeGameDealer.currentThemeName).font(.largeTitle)
            .padding(DrawingConstants.padding)
    }
    
    var shuffleButton: some View {
        Button(Texts.shuffle) {
            withAnimation(Animation.easeInOut(duration: AnimationConstants.dealDuration)) {
                memorizeGameDealer.shuffle()
            }
        }
        .padding(DrawingConstants.padding)
    }
    
    var cardList: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(memorizeGameDealer.cards) { card in
                    CardView(card: card).aspectRatio(DrawingConstants.cardAspectRatio, contentMode: .fit)
                        .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                        .transition(.asymmetric(insertion: .slide, removal: .slide))
                        .zIndex(zIndex(of: card))
                        .onTapGesture {
                            withAnimation {
                                memorizeGameDealer.choose(card: card)
                            }
                        }
                }
            }
        }
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(memorizeGameDealer.cards.filter(isUndealt)) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .scale, removal: .scale))
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: DrawingConstants.undealtWidth, height: DrawingConstants.undealtHeight)
        .onTapGesture {
            for card in memorizeGameDealer.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    // MARK: Method(s)
    
    private func deal(_ card: MemorizeGame<String>.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: MemorizeGame<String>.Card) -> Bool {
        dealt.contains(card.id) == false
    }
    
    private func dealAnimation(for card: MemorizeGame<String>.Card) -> Animation {
        var delay = 0.0
        if let index = memorizeGameDealer.cards.index(matching: card) {
            delay = Double(index) * (AnimationConstants.totalDealDuration / Double(memorizeGameDealer.cards.count))
        }
        return Animation.easeInOut(duration: AnimationConstants.dealDuration).delay(delay)
    }
    
    private func zIndex(of card: MemorizeGame<String>.Card) -> Double {
        -Double(memorizeGameDealer.cards.index(matching: card) ?? 0)
    }
}

extension MemorizeGameView {
    
    private enum Texts {
        static let newGame = "New Game"
        static let shuffle = "Shuffle"
    }
    
    private enum DrawingConstants {
        static let cardAspectRatio: CGFloat = 2 / 3
        static let padding: CGFloat = 30
        
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * cardAspectRatio
    }
    
    private enum AnimationConstants {
        static let dealDuration = 0.5
        static let totalDealDuration = 2.0
    }
}

