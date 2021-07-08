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
    
    func outputName() -> String {
        switch self {
        case .c:
            return "Celsius"
        case .f:
            return "Fahrenheit"
        }
    }
    
    func convert(from original_temp: Double) -> Double {
        switch self {
        case .c:
            return (original_temp - 32) * 5 / 9
        case .f:
            return (original_temp * 9 / 5) - 32
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
        
        let converted_temp = method.convert(from: original_temp)
        
        print("The temperature in \(method.outputName()) is \(converted_temp)")
    }
}

temperatureConverter.main()
