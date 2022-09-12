//
//  ChoiceView.swift
//  NaverOpenAPITest
//
//  Created by ohhyeongseok on 2022/09/02.
//

import SwiftUI

struct ChoiceView: View {
    @StateObject var finder = Finder()
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Search News", destination: NewsList(newsFinder: finder))
                NavigationLink("Search Document", destination: DocumentList(documentFinder: finder))
            }
        }
    }
}

struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView()
    }
}
