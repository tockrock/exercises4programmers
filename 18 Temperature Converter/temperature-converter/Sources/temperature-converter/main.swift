import ArgumentParser

enum Unit {
    case c
    case f
    case k
}

extension Unit {
    func name() -> String {
        switch self {
        case .c:
            return "Celsius"
        case .f:
            return "Fahrenheit"
        case .k:
            return "Kelvin"
        }
    }
    
}

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askUnit(_ question: String) -> Unit {
    while true {
        print("Press C for Celsius.",
              "Press F for Fahrenheit.",
              "Press K for Kelvin",
              separator: "\n")
        
        let input = ask(question)
        
        switch input.lowercased() {
        case "c":
            return .c
        case "f":
            return .f
        case "k":
            return .k
        default:
            continue
        }
    }
}

func askTemperature(method: Unit) -> Double {
    while true {
        let input = ask("Please enter the temperature in \(method.name())")
        
        guard let input: Double = Double(input) else {
            continue
        }
        
        return input
    }
}

func convert(original_temp: Double,
             fromUnit: Unit,
             toUnit: Unit) -> Double {
    
    let celsius: Double
    // convert everything to Celsius first
    switch fromUnit {
    case .f:
        celsius = (original_temp - 32) * 5 / 9
    case .c:
        celsius = original_temp
    case .k:
        celsius = original_temp - 273.15
    }
    
    switch toUnit {
    case .f:
        return (celsius * 9 / 5) + 32
    case .c:
        return celsius
    case .k:
        return celsius + 273.15
    }
    
    
}

struct temperatureConverter: ParsableCommand {
    func run() throws {
        let fromUnit = askUnit("Enter the unit you want to convert from")
        let toUnit = askUnit("Enter the unit you want to convert to")
        
        let original_temp = askTemperature(method: fromUnit)
        
        let converted_temp = convert(original_temp: original_temp, fromUnit: fromUnit, toUnit: toUnit)
        
        print("The temperature in \(toUnit.name()) is \(converted_temp)")
    }
}

temperatureConverter.main()
