//
//  BMICalculatorView.swift
//  BMI Calculator
//
//  Created by 鈴木剛 on 2021/07/16.
//

import SwiftUI

struct BMICalculatorView {
    @State var inputWeight: Double = 50
    @State var inputHeight: Double = 150
    
    var weight: Double {
        inputWeight.tenth
    }
    
    var height: Double {
        inputHeight.tenth
    }
    
    var bmi: Double {
        (weight / pow(height/100, 2)).tenth
    }
}

extension BMICalculatorView: View {
    var body: some View {
        VStack {
            InputSlider(value: $inputWeight, unit: .weight)
            InputSlider(value: $inputHeight, unit: .height)
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
