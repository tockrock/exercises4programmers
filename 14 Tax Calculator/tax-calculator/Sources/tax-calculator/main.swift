import ArgumentParser

func notPositiveNumber() {
    print("Not a positive number.", terminator: " ")
}

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard let input: Double = Double(input) else {
            notPositiveNumber()
            continue
        }
        
        guard input > 0 else {
            notPositiveNumber()
            continue
        }
        
        return input
    }
}

struct taxCalculator: ParsableCommand {
    func run() throws {
        let order = askDouble("What is the order amount?")
        let subtotal = order
        
        
        var tax = 0.0
        
        let state = ask("What is the state").lowercased()
        
        if state == "wi" {
            
            tax = subtotal * 0.055
            print("The Subtotal is \(subtotal)")
            print("The tax is \(tax)")
        }
        
        let total = subtotal + tax
        
        print("The total is \(total)")
    }
}

taxCalculator.main()
