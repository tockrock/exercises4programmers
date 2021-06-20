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

struct item {
    let name: String
    let price: Int
    let quantity: Int
    
    init(name: String) {
        self.name = name
        self.price = askInt("Enter the price of \(name) item")
        self.quantity = askInt("Enter the quantity of \(name) item")
    }
    
}

func result(items: [item]) {
    let subtotal = items.reduce(0){
        $0 + $1.price * $1.quantity
    }
    print(subtotal)
}


struct SelfCheck: ParsableCommand {
    func run() throws {
        let first_item = item(name: "first")
        let second_item = item(name: "second")
        let third_item = item(name: "third")
        
        result(items: [first_item, second_item, third_item])
        
    }
}

SelfCheck.main()
