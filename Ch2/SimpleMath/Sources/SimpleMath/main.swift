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
        
        if let numerical = Double(input) {
            number = numerical
        } else {
            print("Expecting a number.", terminator: " ")
        }
    }
    return number!
}

SimpleMath.main()
