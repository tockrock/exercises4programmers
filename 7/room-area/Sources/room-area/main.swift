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

@available(macOS 10.12, *)
enum specifiedUnit {
    case feet
    case meter
    
    var unit: UnitLength {
        switch self {
        case .feet:
            return .feet
        case .meter:
            return .meters
        }
    }
    
    var areaUnit: UnitArea {
        switch self {
        case .feet:
            return .squareFeet
        case .meter:
            return .squareMeters
        }
    }
    
    var convertUnit: UnitArea {
        switch self {
        case .feet:
            return .squareMeters
        case .meter:
            return .squareFeet
        }
    }
}


struct roomArea : ParsableCommand {
    @Flag(name: .shortAndLong, help: "Enter feats instead")
    var feats = false

    func run() throws {
        
        guard #available(macOS 10.12, *) else {
            print("Sorry your system is not supported")
            return
        }
        
        let unit: specifiedUnit = feats ? .feet : .meter
        
        let length = askForInt("What is the length of the room in \(unit)?")
        let width = askForInt("What is the width of the room in \(unit)?")
        let area = length * width

        
        print("You entered dimensions of \(length) \(unit) by \(width) \(unit).")
        print("The area is:")
        
        let unitArea = Measurement(value: Double(area), unit: unit.areaUnit)
        let converted = unitArea.converted(to: unit.convertUnit)
        
        print(unitArea)
        print(converted)
        
        
    }
}

roomArea.main()
