import Foundation
import ArgumentParser

let paintableAreaPerGallon = 350.0

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard let input: Double = Double(input) else {
            print("Please enter a number.", terminator: " ")
            continue
        }
        
        guard input > 0 else {
            print("Please enter a positive number", terminator: " ")
            continue
        }
        
        return input
    }
}

func requiredPaint(from area: Double) -> Int {
    return Int(ceil(area / paintableAreaPerGallon))
    
}

struct PaintCalculator: ParsableCommand {
    func run() throws {
        let length = askForDouble("Enter length")
        let width = askForDouble("Enter width")
        
        let sqft = length * width
        
        let gallons = requiredPaint(from: sqft)
        
        print("You will need to purchsae \(gallons) gallons of paint to cover \(sqft) square feet.")
    }
}

PaintCalculator.main()
