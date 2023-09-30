import Foundation
import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForInt(_ question: String) -> Int {
    while true {
        let input = ask(question)
        
        guard let input: Int = Int(input) else { continue }
        guard input > 0 else { continue }
        
        return input
        
    }
}

func askAddressForTaxRate() -> Double {
    let adrState = ask("What state do you live in?")
    
    switch adrState.lowercased() {
    case "wi", "wisconsin":
        return askWICountyForTaxRate()
    case "il", "illinois":
        return 0.08
    default:
        return 0
    }
}

func askWICountyForTaxRate() -> Double {
    let adrCounty = ask("Which county do you live in?")
    
    let tax = 0.05
    
    switch adrCounty.lowercased() {
    case "eau claire":
        return tax + 0.005
    case "dunn":
        return tax + 0.004
    default:
        return tax
    }
}

struct SalesTaxCalculator: ParsableCommand {
    func run() throws {
        let amount = Double(askForInt("What is the order amount?"))
        let tax = askAddressForTaxRate()
        
        let taxAmount = amount * tax
        let total = amount + taxAmount

        if tax > 0 {
            print("The tax is \(taxAmount.asUSD).")
        }
        
        print("The total is \(total.asUSD).")
    }
}

extension Double {
    var asUSD: String {
        let cf = NumberFormatter()
        cf.numberStyle = .currency
        cf.currencyCode = "USD"
        
        return cf.string(from: NSNumber(value: self))!
    }
}

SalesTaxCalculator.main()
