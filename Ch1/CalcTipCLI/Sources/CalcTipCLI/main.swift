import Foundation
import ArgumentParser

let numberFormatter = NumberFormatter()

numberFormatter.numberStyle = .currency
numberFormatter.currencyCode = "USD"

struct NonValidNumberError: Error {
    let reason: String
}

extension NonValidNumberError: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Non Valid Number Error: \(reason)"
    }
}

enum InputType {
    case bill
    case tip
    
}

extension InputType {
    var name: String {
        switch self {
        case .bill:
            return "bill amount"
        case .tip:
            return "tip"
        }
    }
}

func getInputWithPrompt(_ prompt: String) throws -> String? {
    print("Enter \(prompt)", terminator: ": ")
    return readLine()
}

func convertInputToDouble(_ inputString: String) throws -> Double {
    guard let amount = Double(inputString) else {
        throw NonValidNumberError(reason: "\"\(inputString)\" cannot be converted to double")
    }
    guard amount >= 0 else {
        throw NonValidNumberError(reason: "\"\(inputString)\" cannot be negative")
    }
    return amount
}

func getInput(inputType: InputType, default input: String?) -> Double {
    var amount: Double?
    var inputString = input
    
    while amount == nil {
        if inputString == nil {
            // this is needed incase the input is provided as an argument
            inputString = try? getInputWithPrompt(inputType.name)
        }
        do {
            amount = try convertInputToDouble(inputString!)
        }
        catch {
            print("\(error). Try Again!")
            inputString = nil
        }
    }
    
    return amount!
}

func getTip(amount: Double, tip: Double) -> Double {
    amount * tip * 0.01
}

func outputCurrency(name: String, amount: Double) {
    let currency = numberFormatter.string(from: NSNumber(floatLiteral: amount))!
    print("\(name): \(currency)")
}


struct TipCalc: ParsableCommand {
    
    @Option(name: .shortAndLong, help: "The charged price.")
    var bill: String?
    
    @Option(name: .shortAndLong, help: "The tip rate.")
    var tip: String?
    
    mutating func run() throws {
        let billAmount = getInput(inputType: .bill, default: bill)
        let tipRate = getInput(inputType: .tip, default: tip)
        
        let tipAmount = getTip(amount: billAmount, tip: tipRate)
        outputCurrency(name: "Tip Amount", amount: tipAmount)
        let totalAmount = billAmount + tipAmount
        outputCurrency(name: "Total", amount: totalAmount)
        
    }
    
}

TipCalc.main()
