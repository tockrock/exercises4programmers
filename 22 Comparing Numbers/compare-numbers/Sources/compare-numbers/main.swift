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

func largerOf(_ first: Double, and second: Double) -> Double {
    if first > second {
        return first
    }
    return second
}

struct CompareNumbers: ParsableCommand {
    func run() throws {
        var numbers: [Double] = []
        numbers.append(askForDouble("Enter the first number"))
        numbers.append(askForDouble("Enter the second number"))
        numbers.append(askForDouble("Enter the third number"))

        var max = numbers [0]

        for i in 1..<numbers.count {
            max = largerOf(max, and: numbers[i])
        }
        
        print("The largest number you've entered is \(max)")
    }
}

CompareNumbers.main()
