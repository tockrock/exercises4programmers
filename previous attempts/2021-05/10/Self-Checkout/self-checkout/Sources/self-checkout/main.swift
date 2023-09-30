import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func invalidInput() {
    print("Please enter a positive number.", terminator: " ")
}

func askQuantity(count: Int) -> Int {
    while true {
        let input = ask("Enter the quantity of item(\(count))")
        
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

func askPrice(count: Int) -> Double? {
    while true {
        let input = ask("Enter the price of item(\(count))")
        
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


struct Item {
    let price: Double
    let quantity: Double

}

func collectItems() -> [Item] {
    var items: [Item] = []
    while true {
        let asking_item = items.count + 1
        let price = askPrice(count: asking_item)
        
        guard let price = price else {
            guard asking_item > 1 else {
                print("You need at least one item.", terminator: " ")
                continue
            }
            
            return items
        }
        
        let quantity = askQuantity(count: asking_item)
        
        items.append((Item(price: price, quantity: Double(quantity))))
    }
}

struct Cart {
    let items: [Item]
    
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

func receipt(cart: Cart) {
    print("Subtotal: \(cart.subtotal)")
    print("Tax: \(cart.tax)")
    print("Total: \(cart.total)")
}

struct SelfCheck: ParsableCommand {
    func run() throws {
        let items = collectItems()
        let cart = Cart(items: items)
        receipt(cart: cart)
        
        
    }
}

SelfCheck.main()
