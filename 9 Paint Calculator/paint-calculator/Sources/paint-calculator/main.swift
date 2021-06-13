import Foundation
import ArgumentParser

let paintableAreaPerGallon = 350.0

extension Double {
    static let tau = Double.pi * 2
}

enum roomType {
    case square
    case circle
    case lShaped
}

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

func askForRoomType() -> roomType {
    while true {
        let input = ask("What kind of room? (s/c/l)")
        
        switch input {
        case "s":
            return .square
        case "c":
            return .circle
        case "l":
            return .lShaped
        default:
            print("Enter one of the room type", terminator: " ")
        }
    }
}

func requiredPaint(for area: Double) -> Int {
    return Int(ceil(area / paintableAreaPerGallon))
    
}

func areaForRoom(roomType: roomType) -> Double {
    switch roomType {
    case .square:
        let length = askForDouble("Enter length")
        let width = askForDouble("Enter width")
        return length * width
    case .circle:
        let radius = askForDouble("Enter radius")
        return Double.tau / 2 * pow(radius, 2)
    case .lShaped:
        let long_length = askForDouble("Enter long length")
        let short_length = askForDouble("Enter short length")
        let long_width = askForDouble("Enter long width")
        let short_width = askForDouble("Enter short width")
        
        return long_length * long_width - short_length * short_width
    }
}

struct PaintCalculator: ParsableCommand {
    func run() throws {
        let roomType = askForRoomType()
        
        let area = areaForRoom(roomType: roomType)
        
        let gallons = requiredPaint(for: area)
        
        print("You will need to purchase \(gallons) gallons of paint to cover \(area) square feet.")
    }
}

PaintCalculator.main()
