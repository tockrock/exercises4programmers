import ArgumentParser

func notPositive() {
    print("Not a positive number.", terminator: " ")

}

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard let input: Double = Double(input) else {
            notPositive()
            continue
        }
        
        guard input > 0 else {
            notPositive()
            continue
        }
        
        return input
    }
}

struct compoundInterest: ParsableCommand {
    func run() throws {
        let principal = askForDouble("What is the principal amount?")
        print("The principal amount is \(principal)")
    }
}

compoundInterest.main()
