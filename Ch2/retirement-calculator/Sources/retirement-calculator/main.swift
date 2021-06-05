import Foundation
import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func intFromInput(_ question: String) -> Int {
    
    while true {
        let input = ask(question)
        
        guard let number = Int(input) else {
            print("Not a number.", terminator: " ")
            continue
        }
        
        guard number > 0 else {
            print("Enter a positive number.", terminator: " ")
            continue
        }
        
        return number
    }
}

struct retirementCalculator: ParsableCommand {
    
    func run() throws {
        let age = intFromInput("What is your current age?")
        let retirement = intFromInput("At what age would you like to retire?")

        let years = retirement - age
        
        let date = Date()
        let calendar = Calendar.current
        
        let current_year = calendar.component(.year, from: date)
        
        print("You have \(years) years left until you can retire")
        print("It's \(current_year), so you can retire in \(current_year + years).")
    }
    
}

retirementCalculator.main()
