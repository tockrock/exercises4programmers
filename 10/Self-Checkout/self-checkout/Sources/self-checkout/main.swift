import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askInt(_ question: String) -> Int {
    while true {
        let input = ask(question)
        
        guard input.count > 0 else {
            print("Please Enter Something.", terminator: " ")
            continue
        }
        
        guard let input: Int = Int(input) else {
            print("Please Enter a Number.", terminator: " ")
            continue
        }
        
        guard input > 0 else {
            print("Please enter a positive number.", terminator: " ")
            continue
        }
        
        return input
    }
}

func askDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard input.count > 0 else {
            print("Please Enter Something.", terminator: " ")
            continue
        }
        
        guard let input: Double = Double(input) else {
            print("Please Enter a Number.", terminator: " ")
            continue
        }
        
        guard input > 0 else {
            print("Please enter a positive number.", terminator: " ")
            continue
        }
        
        return input
    }
}


struct item {
    let name: String
    let price: Double
    let quantity: Double
    
    init(name: String) {
        self.name = name
        self.price = askDouble("Enter the price of \(name) item")
        self.quantity = Double(askInt("Enter the quantity of \(name) item"))
    }
    
}

func calculate(items: [item]) -> (Double, Double, Double) {
    let subtotal = items.reduce(0){
        $0 + $1.price * $1.quantity
    }
    let tax = Double(subtotal) * 0.055
    let total = Double(subtotal) + tax
    
    return (subtotal, tax, total)
}

func report(subtotal: Double, tax: Double, total: Double) {
    print("Subtotal: \(subtotal)")
    print("Tax: \(tax)")
    print("Total: \(total)")
}


struct SelfCheck: ParsableCommand {
    func run() throws {
        let first_item = item(name: "first")
        let second_item = item(name: "second")
        let third_item = item(name: "third")
        
        let (subtotal, tax, total) = calculate(items: [first_item, second_item, third_item])
        report(subtotal: subtotal, tax: tax, total: total)
        
        
    }
}

SelfCheck.main()
