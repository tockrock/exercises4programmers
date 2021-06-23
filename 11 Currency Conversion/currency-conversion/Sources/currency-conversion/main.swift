import Foundation
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
    "eur": 0.83742,
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
struct Amount {
    var value: Double
    var currency: String
}

extension Amount: CustomStringConvertible {
    var description: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
//        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: value)
        return formatter.string(from: number)!
    }
}

struct CurrencyConversion: ParsableCommand {
    func run() throws {
        let currencyFrom = askForCurrency("Select the currency you want to exchange from", currencies: listOfCurrencies)
        let amountFrom = askForDouble("How many \(currencyFrom) are you exchanging?")
        
        let remainingCurrencies = listOfCurrencies.filter{ $0 != currencyFrom }
        let currencyTo = askForCurrency("Select the currency you want to exchange to", currencies: remainingCurrencies)
        
        let rateFrom = exchangeRates[currencyFrom]!
        let rateTo = exchangeRates[currencyTo]!
        
        let rate =  rateTo / rateFrom
        
        let amountTo = amountFrom * rate
        
        let fromAmount = Amount(value: amountFrom, currency: currencyFrom)
        let toAmount = Amount(value: amountTo, currency: currencyTo)
        
        
        print("\(fromAmount) at an exchange rate of \(rate) is \(toAmount)")
    }
}

CurrencyConversion.main()
