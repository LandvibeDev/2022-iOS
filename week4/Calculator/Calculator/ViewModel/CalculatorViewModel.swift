//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Kyungsoo Lee on 2022/08/16.
//

import SwiftUI

/*
 해야할 것
 1. lastSymbol을 받아서 click시 마지막 입력받은 값이 숫자인지 문자인지, 현재 입력받은 값이 숫자인지 문자인지에 따라 다르게 처리
 ex)
    (1) 마지막 입력: 숫자, 현재 입력: 숫자 => expression += currentSymbol
    (2) 마지막 입력: 숫자, 현재 입력: 문자 => 아무 반응X, 다음 숫자를 받을 때까지 대기
    (3) 마지막 입력: 문자, 현재 입력: 숫자 => 문자에 해당하는 연산자를 Calculator에서 수행하고 result값을 ViewModel에 return.
    (4) 마지막 입력: 문자, 현재 입력: 문자 => 아무 반응X, 연산자를 현재 들어온 문자로 교체해주고, 다음 숫자를 받을 때까지 대기. (2번과 거의 동일. 코드 최적화 가능할 듯)
 
 2. lastSymbol이 현재 expression의 마지막 index의 요소를 가져올 수 있게 선언, expression이 바뀔 때마다 lastSymbol도 값이 바뀌어야 함. 그래야 1번 기능을 구현할 수 있음.
 
 3. ViewModel의 click이 호출 될 때마다 (ViewModel에서 1번과정으로 전처리 하여 Model에서는 단순한 연산 기능만 사용) Calculator Model의 click을 통해 result를 갱신한다.
 */

class CalculatorViewModel: ObservableObject {
    let symbols: [[Symbol.Text]]
    var lastSymbol: Character? {
        expresion.last
    }
    
    @Published private var calculator: Calculator
    
    var expresion: String {
        return "\(calculator.result)"
    }
    

    init() {
//        expression = ""
        calculator = Calculator()
        symbols = [[.addition, .toggleSign, .remainder, .divide] ,
                  [.seven, .eight, .nine, .mutiply],
                  [.four, .five, .six, .substract],
                  [.one, .two, .three, .addition],
                  [.zero, .point, .equal]]
//        lastSymbol = "0"
//        expresion = ""
    }
    
    
    
//    func click(currentSymbol: String) -> Void {
//        if lastSymbol == Symbol.TextType.numbers {
//            if CalculatorViewModel.isNumber(symbol: currentSymbol) {
//
//            }
//        }
//    }
    
    static func isNumber(symbol: String) -> Bool {
        if "0" <= symbol, symbol <= "9" {
            return true
        }
        return false
    }
}

