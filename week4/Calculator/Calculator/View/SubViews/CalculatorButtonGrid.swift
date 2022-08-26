//
//  CalculatorButtonGrid.swift
//  Calculator
//
//  Created by changgyo seo on 2022/08/26.
//
import SwiftUI

struct CalculatorButtonGrid<buttonListView: View>: View {
    
    let buttonDataArray: [ButtonDataArray]
    let columnsCount: Int
    let content: (Calculator.ArithmeticOperation) -> buttonListView
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(buttonDataArray) { items in
                HStack(spacing: 0) {
                    ForEach(items.array) { item in
                        let width = widthForColumnsCount(in: UIScreen.main.bounds.size,
                                                         buttonWidth: item.buttonSize)
                        let height = width / CGFloat(item.buttonSize)
                        content(item)
                            .padding(5)
                            .frame(width: width, height: height, alignment: .center)
                    }
                }
            }
        }
    }
    
    init(items: [Calculator.ArithmeticOperation], columnsCount: Int, @ViewBuilder content: @escaping (Calculator.ArithmeticOperation) -> buttonListView) {
        self.buttonDataArray = ButtonDataArray.makeTwoDemsionArrayForColumnsCount(items: items, columnsCount: columnsCount)
        self.columnsCount = columnsCount
        self.content = content
    }
    
    private func widthForColumnsCount(in size: CGSize, buttonWidth width: Int) -> CGFloat {
        let sizeForOne = size.width / CGFloat(columnsCount)
        
        return sizeForOne * CGFloat(width)
    }
}

extension CalculatorButtonGrid {
    struct ButtonDataArray: Identifiable {
        var id: Int
        var array: [Calculator.ArithmeticOperation]
        var totalWidth: Int
        
        init() {
            array = [Calculator.ArithmeticOperation]()
            id = 1
            totalWidth = 0
        }
        
        mutating func append(_ newItem: Calculator.ArithmeticOperation) {
            array.append(newItem)
        }
        
        mutating func changeId() {
            id += 1
            totalWidth = 0
            array.removeAll()
        }
        
        static func makeTwoDemsionArrayForColumnsCount(items: [Calculator.ArithmeticOperation], columnsCount: Int) -> [ButtonDataArray] {
            var arrayWithColumnsCount = ButtonDataArray()
            var TwoDemesionArray = [ButtonDataArray]()
            var rowWidth = 0
            items.forEach { item in
                if rowWidth + item.buttonSize <= columnsCount {
                    arrayWithColumnsCount.append(item)
                    rowWidth += item.buttonSize
                }
                else {
                    arrayWithColumnsCount.totalWidth = rowWidth
                    TwoDemesionArray.append(arrayWithColumnsCount)
                    arrayWithColumnsCount.changeId()
                    arrayWithColumnsCount.append(item)
                    rowWidth = item.buttonSize
                }
            }
            TwoDemesionArray.append(arrayWithColumnsCount)
            return TwoDemesionArray
        }
    }
}
