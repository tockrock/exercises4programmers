import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForInt(_ question: String) -> Int {
    while true {
        let input = ask(question)
        
        guard let input: Int = Int(input) else {
            print("Please enter a number.", terminator: " ")
            continue
        }
        
        guard input > 0 else {
            print("Please enter a positive number", terminator: " ")
            continue
        }
        
        return input
    }
}

struct PaintCalculator: ParsableCommand {
    func run() throws {
        let sqft = askForInt("How many suare feet of paint do you need?")
        
        print("You need to paint \(sqft) square feet.")
    }
}

PaintCalculator.main()
