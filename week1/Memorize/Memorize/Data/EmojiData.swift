//
//  EmojiData.swift
//  Memorize
//
//  Created by 임주민 on 2022/07/29.
//

import Foundation

enum Emoji {
  case vehicles
  case faces
  case sports
  
  var emojiList: [String] {
    switch self {
    case .vehicles:
      return ["🚗", "🚕", "🚙", "🚌", "🚜", "🚚", "🚛", "🛻", "🚎", "🚐", "🚒", "🚑", "🚓", "🏎", "🚞", "🚆", "🚁", "🚀"]
    case .faces:
      return ["🥺", "🥸", "🤩", "😜", "🧐", "😤", "😛", "🥳", "🥶", "😓", "🫡", "🫥", "😡", "😈", "💀", "👹" ,"💩", "👻", "🤖", "🎃"]
    case .sports:
      return ["⚽️", "⚾️", "🏈", "🏀", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏒", "🏑", "🥍" ,"🏏", "🪃", "🥊"]
    }
  }
  
  var shuffle: [String] {
    return self.emojiList.shuffled()
  }
}
