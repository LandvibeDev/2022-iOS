//
//  WellDoneView.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/13.
//

import SwiftUI

struct WellDoneView: View {
  
  let point: Int
  
  var body: some View {
    VStack {
      Text("Well Done!")
      Text("You got \(point) Points!!")
    }
  }
}

struct WellDoneView_Previews: PreviewProvider {
  
  static var previews: some View {
    WellDoneView(point: 0)
  }
}
