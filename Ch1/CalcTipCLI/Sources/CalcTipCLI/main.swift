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

struct TipCalc: ParsableCommand {
    @Flag(help: "Include a counter with each repetition.")
    var includeCounter = false
    
    @Option(name: .shortAndLong, help: "The number of times to repeat 'phrase'.")
    var count: Int?
    
    @Argument(help: "The phrase to repeat.")
    var phrase: String
    
    mutating func run() throws {
        let repeatCount = count ?? 10
        
        for i in 1...repeatCount {
            var prefix = ""
            if includeCounter {
                prefix += "\(i): "
            }
            print("\(prefix)\(phrase)")
        }
    }
    
}

TipCalc.main()
