//
//  AreaView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import SwiftUI

struct AreaView {
    var valid: Bool
    var area: Double
}

extension AreaView: View {
    var body: some View {
        HStack {
            Text("Area:")
                .foregroundColor(valid ? .primary : .secondary)
            Text("\(area)")
                .foregroundColor(valid ? .primary : .clear)
            Spacer()
        }
    }
}

struct AreaView_Previews: PreviewProvider {
    static var previews: some View {
        AreaView(valid: false, area: 3.0)
    }
}
