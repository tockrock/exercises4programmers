import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

struct retirementCalculator: ParsableCommand {
    
    func run() throws {
        let age_input = ask("What is your current age?")
        let retirement_input = ask("At what age would you like to retire?")
        
        guard let age: Int = Int(age_input) else {
            print("sorry didn't understand your age")
            return
        }
        
        guard let retirement: Int = Int(retirement_input) else {
            print("sorry didn't understand your retirement age")
            return
        }
        
        let years = retirement - age
        
        print("You have \(years) years left until you can retire")
        print("It's 2021, so you can retire in \(2021 + years).")
    }
    
}

retirementCalculator.main()
