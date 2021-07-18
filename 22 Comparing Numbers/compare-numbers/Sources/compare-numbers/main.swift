import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        guard let input: Double = Double(input) else {
            continue
        }
        
        return input
    }
}

struct CompareNumbers: ParsableCommand {
    func run() throws {
        var numbers: [Double] = []
        numbers.append(askForDouble("Enter the first number"))
        numbers.append(askForDouble("Enter the second number"))
        numbers.append(askForDouble("Enter the third number"))
        
        print("You've entered the numbers \(numbers)")
    }
}

CompareNumbers.main()
