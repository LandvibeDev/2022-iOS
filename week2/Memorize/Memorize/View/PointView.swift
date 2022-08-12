//
//  PointView.swift
//  Memorize
//
//  Created by Kyungsoo Lee on 2022/08/05.
//

import SwiftUI

struct PointView: View {
    var point: Int
    var body: some View {
        Text("Points: \(point)")
            .foregroundColor(.red)
    }
}

struct PointView_Previews: PreviewProvider {
    static var previews: some View {
        PointView(point: 30)
    }
}
