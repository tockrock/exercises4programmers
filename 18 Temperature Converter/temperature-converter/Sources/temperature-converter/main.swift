import ArgumentParser

enum ConversionMethod {
    case c
    case f
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

struct temperatureConverter: ParsableCommand {
    func run() throws {
        let conversionMethod = askConversionMethod()
        
        print("You've selected \(conversionMethod)")
    }
}

temperatureConverter.main()
