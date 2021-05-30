//
//  Calculator.swift
//  Tip Calculator
//
//  Created by 鈴木剛 on 2021/05/30.
//

import Foundation

class TipCalc: ObservableObject {
    var amount: String = "" {
        didSet {
            calcTip()
        }
    }
    var tip: Double = 10 {
        didSet {
            calcTip()
        }
    }
    
    var rounded_tip: Int {
        Int(tip)
    }
    
    @Published var tipAmount = "$0.00"
    @Published var total = "$0.00"
    
    func formatter(_ value: Double) -> String  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        
        let number = NSNumber(value: value)
        let formattedValue = formatter.string(from: number)!
        return formattedValue
    }

        
    func calcTip() {
        let doubleAmount = Double(amount) ?? 0.0
        let doubleTip = Double(rounded_tip)
        let doubleTipAmount = doubleAmount * doubleTip / 100
        tipAmount = formatter(doubleTipAmount)
        total = formatter(doubleAmount + doubleTipAmount)
    }
}


