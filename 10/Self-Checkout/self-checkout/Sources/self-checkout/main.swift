import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func invalidInput() {
    print("Please enter a positive number.", terminator: " ")
}

func askQuantity() -> Int {
    while true {
        let input = ask("Enter the quantity of item")
        
        guard input.count > 0 else {
            invalidInput()
            continue
        }
        
        guard let input: Int = Int(input) else {
            invalidInput()
            continue
        }
        
        guard input > 0 else {
            invalidInput()
            continue
        }
        
        return input
    }
}

func askPrice() -> Double? {
    while true {
        let input = ask("Enter the price of item")
        
        guard input.count > 0 else {
            return nil
        }
        
        guard let input: Double = Double(input) else {
            invalidInput()
            continue
        }
        
        guard input > 0 else {
            invalidInput()
            continue
        }
        
        return input
    }
}


struct item {
    let price: Double
    let quantity: Double

}

func collectItems() -> [item] {
    var items: [item] = []
    while true {
        let price = askPrice()
        
        guard let price = price else {
            guard items.count > 0 else {
                print("You need at least one item.", terminator: " ")
                continue
            }
            
            return items
        }
        
        let quantity = askQuantity()
        
        items.append((item(price: price, quantity: Double(quantity))))
    }
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
        let items = collectItems()
        let cart = checkout(items: items)
        receipt(cart: cart)
        
        
    }
}

SelfCheck.main()
