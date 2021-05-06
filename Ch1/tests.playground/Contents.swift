import Foundation

var greeting = "Hello, playground"
print(greeting)

typealias USDollars = Double

//extension USDollars {
//    set(self) {
//        self =
//    }
//}


let numberFormatter = NumberFormatter()

numberFormatter.numberStyle = .currency
numberFormatter.currencyCode = "USD"
//numberFormatter.roundingMode = .floor

let numberString = numberFormatter.string(from: 2000.525)
numberString

let tip = 15
let amount: USDollars = 100

func getTip(amount: USDollars, tip: Int) -> USDollars {
    amount * Double(tip) * 0.01
}

let tipAmount = getTip(amount: amount, tip: tip)
numberFormatter.string(from: NSNumber(floatLiteral: tipAmount))
let totalAmount = amount + tipAmount
numberFormatter.string(from: NSNumber(floatLiteral: totalAmount))
