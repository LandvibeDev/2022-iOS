//
//  ViewExtension.swift
//  Memorize
//
//  Created by changgyo seo on 2022/07/25.
//

import SwiftUI

protocol Memorize{
    
    
}

extension Memorize{
    
}

struct ImageAndText: Hashable, Identifiable{
    
    var id: String
    
    let Image: String
    let Text: String
    let distint: String
    
    init(_ Image: String , _ Text: String, _ distint: String = "0"){
        self.Image = Image
        self.Text = Text
        self.distint = distint
        self.id = Image + Text + distint
    }
}
