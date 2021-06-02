import ArgumentParser

struct SimpleMath {
}

extension SimpleMath: ParsableCommand {
    func run() throws {
        let first = askNumber("first")
        let second = askNumber("second")
        
        print("""
\(first) + \(second) = \(first + second)
\(first) - \(second) = \(first - second)
\(first) * \(second) = \(first * second)
\(first) / \(second) = \(first / second)
""")
    }
}

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askNumber(_ name: String) -> Double {
    var number: Double? = nil
    while number == nil {
        let input = ask("What is the \(name) number?")
        
        guard let number_input = Double(input) else {
            print("Expecting a number.", terminator: " ")
            continue
        }
        
        guard !(number_input < 0) else {
            print("Expecting a positive number.", terminator: " ")
            continue
        }
        
        number = number_input
    }
    return number!
}

SimpleMath.main()
