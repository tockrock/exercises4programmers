//
//  InputSlider.swift
//  BMI Calculator
//
//  Created by 鈴木剛 on 2021/07/16.
//

import SwiftUI

enum Unit {
    case height
    case weight
}

extension Unit {
    var min: Double {
        switch self {
        case .height: return 100
        case .weight: return 40
        }
    }
    
    var max: Double {
        switch self {
        case .height: return 200
        case .weight: return 100
        }
    }
    
    var unit: String {
        switch self {
        case .height: return "cm"
        case .weight: return "kg"
        }
    }
}

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
