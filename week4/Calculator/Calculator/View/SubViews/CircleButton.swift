//
//  CircleButton.swift
//  Calculator
//
//  Created by 임주민 on 2022/08/21.
//

import SwiftUI

struct CircleButton: View {
  
  let content: String
  let color: Color
  
  var body: some View {
    Circle()
      .frame(width: 70, height: 70)
      .foregroundColor(color)
      .overlay {
        Text(content)
          .font(.system(size: 40))
      }
  }
}
