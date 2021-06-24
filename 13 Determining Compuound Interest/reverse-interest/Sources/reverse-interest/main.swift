import Foundation
import ArgumentParser

func calculateInterest(target: Double, rate: Double, years: Int, compoundPerYear: Int) -> Double {
    let doubleYears = Double(years)
    let doubleCompound = Double(compoundPerYear)
    
    let principal = target / pow((1 + rate / doubleCompound), (doubleCompound * doubleYears))
    return principal
}

struct reverseInterest: ParsableCommand {
    func run() throws {
        let target = askForDouble("What is the target amount")
        let rate = askForDouble("What is the rate?") / 100
        let years = askForRoundedInt("What is the number of years?")
        let compoundPerYear = askForRoundedInt("What is the number of times the interest is compounded per year?")
        
        let principal = calculateInterest(target: target, rate: rate, years: years, compoundPerYear: compoundPerYear)
        
        print("You need to invest \(output(principal, as: .currency)) for \(years) years to get \(output(target, as: .currency)) when compounding \(compoundPerYear) times per year at \(output(rate, as: .percent)) ")
        
    }
}

reverseInterest.main()
