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

func askForRoundedInt(_ question: String) -> Int {
    return Int(ceil(askForDouble(question)))
}

struct compoundInterest: ParsableCommand {
    func run() throws {
        let principal = askForDouble("What is the principal amount?")
        let bareRate = askForDouble("What is the rate?") / 100
        let years = askForRoundedInt("What is the number of years?")
        let compoundPerYear = askForRoundedInt("What is the number of times the interest is compounded per year?")
        
        print("\(principal) invested at \(bareRate) for \(years) compounded \(compoundPerYear) times per year is \\(amount)")
    }
}

compoundInterest.main()
