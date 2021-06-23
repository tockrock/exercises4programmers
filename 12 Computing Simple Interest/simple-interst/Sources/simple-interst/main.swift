import Foundation
import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func notPositiveNumber() {
    print("Not a positive number.", terminator: " ")
}
    

func askForDouble(_ question: String) -> Double {
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

func calculateSimpleInterest(pricipal: Double, rate: Double, years: Int) -> Double {
    
    var amount = pricipal
    for _ in 1...years {
        amount = amount * ( 1 + rate / 100 )
    }
    
    return amount
}

let currencyFormatter = NumberFormatter()
currencyFormatter.numberStyle = .currency
currencyFormatter.currencyCode = "USD"

let rateFormatter = NumberFormatter()
rateFormatter.numberStyle = .percent


struct SimpleInterest: ParsableCommand {
    func run() throws {
        let principal = askForDouble("Enter the principal")
        let bareRate = askForDouble("Enter the rate of interest")
        let years = askForDouble("Enter the number of years")
        let roundedYears = Int(ceil(years))

        let bareAmount = calculateSimpleInterest(pricipal: principal, rate: bareRate, years: roundedYears)
        let amount = NSNumber(value: bareAmount)
        
        let rate = NSNumber(value: bareRate)
        
        let formattedAmount = currencyFormatter.string(from: amount)!
        let formattedRate = rateFormatter.string(from: rate)!
        
        print("After \(roundedYears) at \(formattedRate), the investment will be worth \(formattedAmount)")
    }
}

SimpleInterest.main()
