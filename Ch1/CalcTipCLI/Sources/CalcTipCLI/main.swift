import ArgumentParser

func main() {
    print("What is the amount?")
    let priceInput = readLine() ?? ""
    print("What is the percentage for the tip?")
    let tipInput = readLine() ?? ""

    let price = Double(priceInput)
    let tip = Double(tipInput)

    let tipAmount = price! * tip! * 0.01
    let total = price! + tipAmount

    print("tip is \(tipAmount)")
    print("total  is \(total)")
}

// main()

func getInputWithPrompt(_ prompt: String) throws -> Double {
    print("Enter \(prompt)", terminator: ": ")
    let inputAmount = readLine() ?? ""
    
    guard let amount = Double(inputAmount) else {
        throw NonValidNumberError(reason: "\(inputAmount) cannot be converted to double")
    }
    return amount

}

struct NonValidNumberError: Error {
    let reason: String
}

extension NonValidNumberError: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Non Valid Number Error - \(reason)"
    }
}

struct TipCalc: ParsableCommand {
    
    @Option(name: .shortAndLong, help: "The charged price.")
    var billAmount: String?
    
    @Option(name: .shortAndLong, help: "The tip rate.")
    var tip: String?
    
    mutating func run() throws {
//        while charged == nil {
//            let chargeInput = getInputWithPrompt("bill amount")
//        }
        
        do {
            let amount = try getInputWithPrompt("bill amount")
            print(amount)
        }
        catch {
            print("Error: \(error)")
            return
        }
        
    }
    
}

TipCalc.main()
