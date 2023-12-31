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

extension InputType {
    func validate(_ inputString: String) throws -> Double {
        guard let amount = Double(inputString) else {
            throw NonValidNumberError(reason: "can't convert to double \"\(inputString)\"")
        }
        guard amount >= 0 else {
            throw NonValidNumberError(reason: "can't be negative \"\(inputString)\"")
        }
        
        if self == .tip {
            guard amount < 100 else {
                throw NonValidNumberError(reason: "\(self.name) can't be over 100 \"\(inputString)\"")
            }
        }
        
        return amount
    }
}

func getInputWithPrompt(_ prompt: String) -> String {
    print("Enter \(prompt)", terminator: ": ")
    return readLine() ?? ""
}

func getInput(inputType: InputType, default input: String?, response: Bool = false) throws -> Double {
    var amount: Double?
    var inputString = input
    
    while amount == nil {
        // this is needed incase the input is provided as an argument
        if inputString == nil {
            inputString = getInputWithPrompt(inputType.name)
        }
        
        do {
            amount = try inputType.validate(inputString!)
        }
        catch {
            if response {
                throw error
            }
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
    
    @Flag(name: .shortAndLong, help: "Returns the errors, instead of asking for the correct result.")
    var response: Bool = false
    
    mutating func run() throws {
        let billAmount: Double
        let tipRate: Double
        
        do {
            billAmount = try getInput(inputType: .bill, default: bill, response: response)
            tipRate = try getInput(inputType: .tip, default: tip, response: response)
        }
        catch {
            print(error)
            return
        }
        
        let tipAmount = getTip(amount: billAmount, tip: tipRate)
        outputCurrency(name: "Tip Amount", amount: tipAmount)
        let totalAmount = billAmount + tipAmount
        outputCurrency(name: "Total", amount: totalAmount)
        
    }
    
}

TipCalc.main()
