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

func calculateSimpleInterest(principal: Double, rate: Double, year: Int) -> Double {
    return principal * ( 1 + rate * Double(year))
}

let currencyFormatter = NumberFormatter()
currencyFormatter.numberStyle = .currency
currencyFormatter.currencyCode = "USD"

let rateFormatter = NumberFormatter()
rateFormatter.numberStyle = .percent


struct SimpleInterest: ParsableCommand {
    func run() throws {
        let principal = askForDouble("Enter the principal")
        let percentRate = askForDouble("Enter the rate of interest")
        let bareRate = percentRate / 100

        let years = askForDouble("Enter the number of years")
        let roundedYears = Int(ceil(years))
        
        let formattedRate = rateFormatter.string(from: NSNumber(value: bareRate))!

        for year in 1...roundedYears {
            let bareAmount = calculateSimpleInterest(principal: principal, rate: bareRate, year: year)
            let amount = NSNumber(value: bareAmount)
            let formattedAmount = currencyFormatter.string(from: amount)!
            
            print("After \(year) years at \(formattedRate), the investment will be worth \(formattedAmount)")
        }
    }
}

SimpleInterest.main()
