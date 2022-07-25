//
//  ThemeButtonView.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

struct ThemeButtonListView: View {
    let buttonsImageAndTexts = [ImageAndText("globe.asia.australia", "Country"), ImageAndText("face.dashed","Emotion"), ImageAndText("fork.knife.circle","Food")]
    
    @EnvironmentObject var gameManager: MemorizeCardGameManger
    
    var body: some View {
        HStack{
            Spacer()
            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()], spacing: 0) {
                ForEach(buttonsImageAndTexts, id: \.self){ content in
                    Button(action: {}){
                        ThemeButtonView(content: content)
                            .onTapGesture {
                                switch content.Text {
                                case "Country":
                                    gameManager.changeTheme(.country)
                                    if gameManager.currentCardNumber > ThemeInfo.country.maxCardNumber {
                                        gameManager.currentCardNumber = ThemeInfo.country.maxCardNumber
                                    }
                                case "Emotion":
                                    gameManager.changeTheme(.emotion)
                                    if gameManager.currentCardNumber > ThemeInfo.emotion.maxCardNumber {
                                        gameManager.currentCardNumber = ThemeInfo.emotion.maxCardNumber
                                    }
                                case "Food":
                                    gameManager.changeTheme(.food)
                                    if gameManager.currentCardNumber > ThemeInfo.food.maxCardNumber {
                                        gameManager.currentCardNumber = ThemeInfo.food.maxCardNumber
                                    }
                                default:
                                    fatalError("Wrong Theme Tapped in ThemeButtonListView")
                                }
                            }
                    }
                }
            }
            Spacer()
        }
        
    }
}

struct ThemeButtonListView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeButtonListView()
    }
}
