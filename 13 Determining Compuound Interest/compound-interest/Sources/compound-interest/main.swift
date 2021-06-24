import Foundation
import ArgumentParser

func notPositive() {
    print("Not a positive number.", terminator: " ")

}

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard let input: Double = Double(input) else {
            notPositive()
            continue
        }
        
        guard input > 0 else {
            notPositive()
            continue
        }
        
        return input
    }
}


func calculateCompoundInterest(principal: Double, rate: Double, years: Int, compoundPerYear: Int) -> Double {
    let doubleYears = Double(years)
    let doubleCompounds = Double(compoundPerYear)
    
    let amount = principal * pow((1 + rate/doubleCompounds),doubleCompounds * doubleYears)
    
    return amount
}

enum outputOption {
    case currency
    case percent
}

func output(_ amount: Double, as option: outputOption) -> String {
    let formatter = NumberFormatter()
    switch option {
    case .currency:
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
    case .percent:
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
    }
    return formatter.string(from: NSNumber(value: amount))!
}

struct compoundInterest: ParsableCommand {
    func run() throws {
        let principal = askForDouble("What is the principal amount?")
        let rate = askForDouble("What is the rate?") / 100
        let years = askForRoundedInt("What is the number of years?")
        let compoundPerYear = askForRoundedInt("What is the number of times the interest is compounded per year?")
        
        let amount = calculateCompoundInterest(principal: principal, rate: rate, years: years, compoundPerYear: compoundPerYear)
        
        
        print("\(output(principal, as: .currency)) invested at \(output(rate, as: .percent)) for \(years) compounded \(compoundPerYear) times per year is \(output(amount, as: .currency))")
    }
}

compoundInterest.main()
