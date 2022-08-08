//
//  EmojiTheme.swift
//  Memorize
//
//  Created by 임주민 on 2022/08/08.
//

import Foundation
import SwiftUI

enum EmojiTheme {
  case vehicles
  case faces
  case sports
  case hearts
  case flags
  case foods
  
  var content: [String] {
    switch self {
    case .vehicles:
      return ["🚗", "🚕", "🚙", "🚌", "🚜", "🚚", "🚛", "🛻", "🚎", "🚐", "🚒", "🚑", "🚓", "🏎", "🚞"]
    case .faces:
      return ["😓", "🫡", "🫥", "😡", "😈", "💀", "👹" ,"💩", "👻", "🤖", "🎃"]
    case .sports:
      return  ["⚽️", "⚾️", "🏈", "🏀", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒", "🏑", "🥍"]
    case .hearts:
      return ["❤️", "🧡", "💛", "💔", "❤️‍🔥", "❤️‍🩹", "💚", "💙", "💝", "💖", "💜", "🤍", "🖤"]
    case .flags:
      return ["🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇧🇬", "🇮🇸", "🇰🇷", "🇭🇰", "🇵🇷", "🇩🇰", "🇦🇪", "🇯🇵", "🇲🇱", "🇺🇸", "🇬🇧", "🇨🇳" ,"🇵🇭", "🇨🇦", "🇹🇷"]
    case .foods:
      return ["🍟", "🍮", "🍡", "🍭", "🥐", "🥝", "🍬", "🍅", "🍋", "🍇", "🍓", "🌽"]
    }
  }
  
  var color: Color {
    switch self {
    case .vehicles:
      return .pink
    case .faces:
      return .yellow
    case .sports:
      return .orange
    case .hearts:
      return .green
    case .flags:
      return .black
    case .foods:
      return .blue
    }
  }
}
