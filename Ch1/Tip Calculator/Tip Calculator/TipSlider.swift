//
//  TipSlider.swift
//  Tip Calculator
//
//  Created by 鈴木剛 on 2021/05/30.
//

import SwiftUI

struct TipSlider {
    let min:Double = 0
    let max:Double = 20
    @Binding var value: Double
}

extension TipSlider: View {
    var body: some View {
        Slider(value: $value,
               in: min...max)
            .padding()
    }
}

struct TipSlider_Previews: PreviewProvider {
    static var previews: some View {
        TipSlider(value: .constant(15))
    }
}
