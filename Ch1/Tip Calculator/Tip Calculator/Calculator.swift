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
            isAmountValidated = validateAmount()
            calcTip()
        }
    }
    var tip: Double = 10 {
        didSet {
            calcTip()
        }
    }
    var calcultedAmount: Double = 0.0 {
        didSet {
            displayAmount = formatter(calcultedAmount)
        }
    }
    
    var roundedTip: Int {
        Int(tip)
    }
    
    @Published var isAmountValidated = true
    @Published var displayAmount = "$0.00"
    @Published var tipAmount = "$0.00"
    @Published var total = "$0.00"
    
    func validateAmount() -> Bool {
        guard amount != "" else {
            calcultedAmount = 0.0
            return true
        }
        
        guard let doubleAmount = Double(amount) else {
            calcultedAmount = 0.0
            return false
        }
        
        guard doubleAmount > 0 else {
            calcultedAmount = 0.0
            return false
        }
        
        calcultedAmount = roundWithPercision(doubleAmount, percision: .hundredths)
        return true
    }
    
    func formatter(_ value: Double) -> String  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        
        let number = NSNumber(value: value)
        let formattedValue = formatter.string(from: number)!
        return formattedValue
    }

        
    func calcTip() {
        let doubleTip = Double(roundedTip)
        let doubleTipAmount = calcultedAmount * doubleTip / 100
        tipAmount = formatter(doubleTipAmount)
        total = formatter(calcultedAmount + doubleTipAmount)
    }
}


