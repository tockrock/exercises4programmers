//
//  BMICalculatorView.swift
//  BMI Calculator
//
//  Created by 鈴木剛 on 2021/07/16.
//

import SwiftUI

struct BMICalculatorView {
    let minWeight: Double = 0
    let maxWeight: Double = 100
    @State var weight: Double = 50
    
    let minHight: Double = 100
    let maxHeight: Double = 200
    @State var height: Double = 150
    
    var bmi: Double {
        (weight / pow(height/100, 2)).tenth
    }
}

extension BMICalculatorView: View {
    var body: some View {
        VStack {
            Text("\(weight.tenth.description)kg")
            Slider(value: $weight, in: minWeight...maxWeight)
            Text("\(height.tenth.description)cm")
            Slider(value: $height, in: minHight...maxHeight)
            BMIReviewView(bmi: bmi)
            Spacer()
        }
    }
}

extension Double {
    var tenth: Double {
        (self * 10).rounded() / 10
    }
}

struct BMICalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        BMICalculatorView()
    }
}
