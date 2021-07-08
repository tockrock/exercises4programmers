import Foundation
import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard let input: Double = Double(input) else {
            continue
        }
        
        guard input > 0 else {
            continue
        }
        
        return input
    }
}

struct bmiCalculator: ParsableCommand {
    func run() throws {
        let weight = askDouble("What is your weight? (kg)")
        let height = askDouble("What is your height? (cm)")
        
        let bmi = weight / pow(height/100, 2)
        print("Your BMI is \(bmi)")
    }
}

bmiCalculator.main()
