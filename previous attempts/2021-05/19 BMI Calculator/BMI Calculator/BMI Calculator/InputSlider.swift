//
//  InputSlider.swift
//  BMI Calculator
//
//  Created by 鈴木剛 on 2021/07/16.
//

import SwiftUI

struct InputSlider {
    @Binding var value: Double
    let unit: Unit
}

extension InputSlider: View {
    var body: some View {
        VStack {
            Text("\(value.tenth.description)\(unit.unit)")
            Slider(value: $value,
                   in: unit.min...unit.max)
        }
    }
}

struct InputSlider_Previews: PreviewProvider {
    static var previews: some View {
        InputSlider(value: .constant(50.0), unit: .weight)
    }
}
