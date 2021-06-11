import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askInt(_ question: String) -> Int {
    while true {
        let input = ask(question)
        
        guard let number: Int = Int(input) else {
            print("Please enter a number.", terminator: " ")
            continue
        }
        
        guard number > 0 else {
            print("Please enter a positive number.", terminator: " ")
            continue
        }
        
        return number
    }
}

func divide(pizza pizza_count: Int, with people_count: Int) -> (Int, Int) {
    let slices = pizza_count * 8
    
    let each: Int = slices / people_count // just in case
    let remain = slices % people_count
    
    
    return (each, remain)
}

struct pizzaParty: ParsableCommand {
    
    func run() throws {
        let people_count = askInt("How many people?")
        let pizza_count = askInt("How many pizzas do you have?")
        
        let (each, remain) = divide(pizza: pizza_count, with: people_count)
        
        print("\(people_count) people with \(pizza_count) pizzas")
        print("Each person gets \(each) pieces of pizza")
        print("There are \(remain) leftover pieces.")
    }
    
}

pizzaParty.main()
