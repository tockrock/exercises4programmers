import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func invalidPositiveDouble() {
    print("Not a positive number.", terminator: " ")
}

let exchangeRates = [
    "usd": 1.0,
    "euro": 0.83742,
    "jpy": 110.66,
]

var listOfCurrencies = exchangeRates.map { $0.key }

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

func askForCurrency(_ question: String, currencies: [String]) -> String {
    let stringOfCurrencies = currencies.joined(separator: "/")
    let questionWithList = "\(question) (\(stringOfCurrencies))"

    while true {
        let input = ask(questionWithList)
        
        guard currencies.contains(input) else {
            print("Not a valid currency.", terminator: " ")
            continue
        }
        
        return input
        
    }
}

struct CurrencyConversion: ParsableCommand {
    func run() throws {
        let currency = askForCurrency("This is the question", currencies: listOfCurrencies)
        print(currency)
        let amountFrom = askForDouble("How many euros are you exchanging?")
        let rate = askForDouble("What is the exchange rate?")
        
        let amountTo = amountFrom * rate / 100
        
        
        print("\(amountFrom) euros at an exchange rate of \(rate) is \(amountTo) U.S. dollars.")
    }
}

CurrencyConversion.main()
