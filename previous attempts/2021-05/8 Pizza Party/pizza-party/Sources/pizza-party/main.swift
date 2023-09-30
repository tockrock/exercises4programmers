import Foundation
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


struct pizzaParty: ParsableCommand {
    func divide(pizza pizza_count: Int, with people_count: Int) -> (Int, Int) {
        let slices = pizza_count * 8
        
        let each: Int = slices / people_count // just in case
        let remain = slices % people_count
        
        
        return (each, remain)
    }
    
    func provide(_ request: Int, to people_count: Int) -> (Int, Int) {
        
        let required_piece = request * people_count
        
        let pizza_count: Int = Int(ceil(Double(required_piece) / 8))
        let remain = pizza_count * 8 - required_piece
        
        return (pizza_count, remain)
    }
    
    func run() throws {
        let people_count = askInt("How many people?")
        let request = askInt("How many pizzas does every one wants?")
        
        let (required, remain) = provide(request, to: people_count)
        
        print("Providing \(people_count) people with \(request) peices of pizzas")

        print("Order \(required) pizzas")
        print("There are \(remain) leftover peices.")
    }
}

pizzaParty.main()
