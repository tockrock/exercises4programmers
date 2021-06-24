import ArgumentParser


struct reverseInterest: ParsableCommand {
    func run() throws {
        let target = askForDouble("What is the target amount")
        let rate = askForDouble("What is the rate?") / 100
        let years = askForRoundedInt("What is the number of years?")
        let compoundPerYear = askForRoundedInt("What is the number of times the interest is compounded per year?")
        
        
    }
}

reverseInterest.main()
