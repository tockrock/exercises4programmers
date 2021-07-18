import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForDouble(_ question: String, except previous: Set<Double> = []) -> Double {
    while true {
        let input = ask(question)
        guard let input: Double = Double(input) else {
            continue
        }
        guard !previous.contains(input) else {
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
        var numbers: Set<Double> = []
        numbers.insert(askForDouble("Enter the first number", except: numbers))
        numbers.insert(askForDouble("Enter the second number", except: numbers))
        numbers.insert(askForDouble("Enter the third number", except: numbers))

        var max = numbers.removeFirst()

        while !numbers.isEmpty {
            max = largerOf(max, and: numbers.removeFirst())
        }
        
        print("The largest number you've entered is \(max)")
    }
}

CompareNumbers.main()
