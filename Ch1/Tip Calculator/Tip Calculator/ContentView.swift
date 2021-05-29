//
//  ContentView.swift
//  Tip Calculator
//
//  Created by 鈴木剛 on 2021/05/29.
//

import SwiftUI

struct ContentView {
    @StateObject private var tipcalc = TipCalc()
}

extension ContentView: View {
    var body: some View {
        VStack {
            TextField("Amount Billed", text: $tipcalc.amount)
                .keyboardType(.decimalPad)
                .padding()
            
            TextField("Tip Rate", text: $tipcalc.tip)
                .keyboardType(.decimalPad)
                .padding()
            
            Button("Calculate Tip", action: tipcalc.calcTip)
            
            Text("Tip Amount: \(tipcalc.tipAmount)")
                .padding()
            
            Text("Total: \(tipcalc.total)")
                .padding()
        }
        
    }
}

class TipCalc: ObservableObject {
    @Published var amount: String = ""
    @Published var tip: String = ""
    
    @Published var tipAmount = 0.0
    @Published var total = 0.0
    
    func calcTip() -> Void {
        let double_amount = Double(amount) ?? 0.0
        let double_tip = Double(tip) ?? 0.0
        tipAmount =  double_amount * double_tip / 100
        total = double_amount + tipAmount
    }
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
