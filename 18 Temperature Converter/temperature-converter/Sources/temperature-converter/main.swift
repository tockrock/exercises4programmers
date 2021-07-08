import ArgumentParser

enum ConversionMethod {
    case c
    case f
    
    func inputName() -> String {
        switch self {
        case .c:
            return "Fahrenheit"
        case .f:
            return "Celsius"
        }
    }
}

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askConversionMethod() -> ConversionMethod {
    while true {
        print("Press C to convert from Fahrenheit to Celsius.",
              "Press F to convert from Celsius to Fahrenheit.", separator: "\n")
        
        let input = ask("Your choice")
        
        switch input.lowercased() {
        case "c":
            return ConversionMethod.c
        case "f":
            return ConversionMethod.f
        default:
            continue
        }
    }
}

func askTemperature(method: ConversionMethod) -> Double {
    while true {
        let input = ask("Please enter the temperature in \(method.inputName())")
        
        guard let input: Double = Double(input) else {
            continue
        }
        
        return input
    }
}

struct temperatureConverter: ParsableCommand {
    func run() throws {
        let method = askConversionMethod()
        
        let original_temp = askTemperature(method: method)
        
        print("You want to convert \(original_temp) \(method.inputName()) to the other thing")
    }
}

temperatureConverter.main()
