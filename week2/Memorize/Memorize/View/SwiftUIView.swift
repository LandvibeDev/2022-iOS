//
//  SwiftUIView.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/20.
//

import SwiftUI

struct SwiftUIView: View {
  var body: some View {
    VStack{
      Text("자신의 이름을 화면에 써보세요!")
        .font(.largeTitle)
    
      List {
        
        Text("이소희")
          .foregroundColor(.pink)
        
        Text("김은호")
          .foregroundColor(.purple)
        
        Text("정제혁")
          .foregroundColor(.black)
        
        Text("임주민")
          .foregroundColor(.red)
        
        Text("김나연")
          .foregroundColor(.blue)
        
        Text("김태정")
          .foregroundColor(.pink)
        
        Text("김산아")
          .foregroundColor(.purple)
        
        Text("김기준")
          .foregroundColor(.blue)
          
      }
    }
    .font(.body)
    .padding()
  }
}


struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIView()
  }
}
