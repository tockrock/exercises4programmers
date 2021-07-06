import Foundation
import ArgumentParser

func notPositiveNumber() {
    print("Not a positive number.", terminator: " ")
}

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard let input: Double = Double(input) else {
            notPositiveNumber()
            continue
        }
        
        guard input > 0 else {
            notPositiveNumber()
            continue
        }
        
        return input
    }
}

struct taxCalculator: ParsableCommand {
    func run() throws {
        let order = askDouble("What is the order amount?")
        let subtotal = order
        
        
        var tax = 0.0
        
        let state = ask("What is the state").lowercased()
        
        if state == "WI".lowercased() || state == "Wisconsin".lowercased() {
            
            tax = (subtotal * 0.055).nearestCent()
            print("The subtotal is \(subtotal.formatUSD())")
            print("The tax is \(tax.formatUSD())")
        }
        
        let total = subtotal + tax
        
        print("The total is \(total.formatUSD())")
    }
}

extension Double {
    func nearestCent() -> Double {
        return (self * 100).rounded() / 100
    }
    
    func formatUSD() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = "USD"
        
        return currencyFormatter.string(from: NSNumber(value: self))!
    }
}

taxCalculator.main()
