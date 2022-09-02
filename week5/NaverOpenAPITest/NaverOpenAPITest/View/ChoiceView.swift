//
//  ChoiceView.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import SwiftUI

struct ChoiceView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Search News", destination: NewsList())
                NavigationLink("Search Movie", destination: MovieList())
                NavigationLink("Search Document", destination: DocumentList())
            }
        }
    }
}

struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView()
    }
}
