//
//  AreaView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import Foundation
import SwiftUI

struct ResultView {
    var valid: Bool
    var area: Double
    var gallons: Int {
        Int(ceil(area/350))
    }
}

extension ResultView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Area:")
                    .foregroundColor(valid ? .primary : .secondary)
                Text("\(area)")
                    .foregroundColor(valid ? .primary : .clear)
                Spacer()
            }
            HStack {
                Text("Required Paint (gallons):")
                    .foregroundColor(valid ? .primary : .secondary)
                Text("\(gallons)")
                    .foregroundColor(valid ? .primary : .clear)
                Spacer()
            }
        }
    }
}

struct AreaView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(valid: true, area: 360)
    }
}
