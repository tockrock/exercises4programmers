import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func invalidPositiveDouble() {
    print("Not a positive number.", terminator: " ")
}

func askForDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard input.count > 0 else {
            invalidPositiveDouble()
            continue
        }
        
        guard let input: Double = Double(input) else {
            invalidPositiveDouble()
            continue
        }
        
        guard input > 0 else {
            invalidPositiveDouble()
            continue
        }
        
        return input
    }
}

struct CurrencyConversion: ParsableCommand {
    func run() throws {
        let amountFrom = askForDouble("How many euros are you exchanging?")
        let rate = askForDouble("What is the exchange rate?")
        
        let amountTo = amountFrom * rate / 100
        
        
        print("\(amountFrom) euros at an exchange rate of \(rate) is \(amountTo) U.S. dollars.")
    }
}

CurrencyConversion.main()
