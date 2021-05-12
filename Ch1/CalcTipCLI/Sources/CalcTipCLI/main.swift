import ArgumentParser

struct NonValidNumberError: Error {
    let reason: String
}

extension NonValidNumberError: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Non Valid Number Error - \(reason)"
    }
}

func getInputWithPrompt(_ prompt: String) throws -> Double {
    print("Enter \(prompt)", terminator: ": ")
    let inputAmount = readLine() ?? ""
    
    guard let amount = Double(inputAmount) else {
        throw NonValidNumberError(reason: "\(inputAmount) cannot be converted to double")
    }
    return amount

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
