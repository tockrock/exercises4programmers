import Foundation
import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForInt(_ question: String) -> Int {
    while true {
        let input = ask(question)
        
        guard let number: Int = Int(input) else {
            print("Please enter a number.", terminator: " ")
            continue
        }
        
        guard number > 0 else {
            print("Please enter a positive number", terminator: " " )
            continue
        }
        
        return number
    }
}

struct roomArea : ParsableCommand {
    func run() throws {
        let length = askForInt("What is the length of the room in feet?")
        let width = askForInt("What is the width of the room in feet?")
        let area = length * width

        
        print("You entered dimensions of \(length) feet by \(width) feet.")
        print("The area is:")
        
        if #available(macOS 10.12, *) {
            let unitArea = Measurement(value: Double(area), unit: UnitArea.squareFeet)
            let converted = unitArea.converted(to: .squareMeters)
            
            print(unitArea)
            print(converted)
            
        } else {
            // Fallback on earlier versions
        }
        
        
    }
}

roomArea.main()
