//
//  ViewExtension.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

/// this struct use many Views
/// for example, cardView need image and description
/// themeButton need same
struct ImageAndText: Hashable, Identifiable{
    
    //use to be hashable this struct
    var id: String
    let Image: String
    let Text: String
    
    //if user don't call third parameter, struct will be initalized to "0"
    init(_ Image: String, _ Text: String, _ distinct: String = "0"){
        self.Image = Image
        self.Text = Text
        self.id = Image + Text + distinct
    }
}
