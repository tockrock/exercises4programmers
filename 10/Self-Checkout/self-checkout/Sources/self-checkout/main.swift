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

func collect(item_names: [String]) -> [item] {
    var items: [item] = []
    for item_name in item_names {
        items.append(item(name: item_name))
    }
    return items
}

struct checkout {
    let items: [item]
    
    var subtotal: Double {
        items.reduce(0){
            $0 + $1.price * $1.quantity
        }
    }
    var tax: Double {
        Double(subtotal) * 0.055
    }
    var total: Double {
        Double(subtotal) + tax
    }
}

func receipt(cart: checkout) {
    print("Subtotal: \(cart.subtotal)")
    print("Tax: \(cart.tax)")
    print("Total: \(cart.total)")
}

struct SelfCheck: ParsableCommand {
    func run() throws {
        let items = collect(item_names: ["first", "second", "third"])
        let cart = checkout(items: items)
        receipt(cart: cart)
        
        
    }
}

SelfCheck.main()
