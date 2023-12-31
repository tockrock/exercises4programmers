//
//  CalculatorView.swift
//  Tip Calculator
//
//  Created by 鈴木剛 on 2021/05/30.
//

import SwiftUI

struct CalculatorView {
    @StateObject private var tipCalc = TipCalc()
    
    let min: Double = 0
    let max: Double = 20
    
}

extension CalculatorView: View {
    var body: some View {
        VStack {            
            TextField("Amount Billed", text: $tipCalc.amount)
                .keyboardType(.decimalPad)

            if tipCalc.isAmountValidated {
                Text("Billed Amount: \(tipCalc.displayAmount)")
            } else {
                Text("Invalid Amount: \(tipCalc.amount)")
                    .foregroundColor(.red)
            }
            
            Slider(value: $tipCalc.tip,
                   in: min...max)
            
            Text("Tip: \(tipCalc.roundedTip)%")
                .padding(.bottom)
            
            Text("Tip Amount: \(tipCalc.tipAmount)")
            Text("Total: \(tipCalc.total)")
        }
        .padding()
    }
}


struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
