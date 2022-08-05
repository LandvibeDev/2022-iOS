//
//  FooterView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/05.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        Button {
            
        } label: {
            Text("New Game")
                .foregroundColor(.red)
        }
    }
}

struct FooterView_Previeaws: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}
