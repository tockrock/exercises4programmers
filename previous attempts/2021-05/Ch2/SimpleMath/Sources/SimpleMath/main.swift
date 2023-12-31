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
    while true {
        let input = ask("What is the \(name) number?")
        
        guard let number: Double = Double(input) else {
            print("Expecting a number.", terminator: " ")
            continue
        }
        
        guard number > 0 else {
            print("Expecting a positive number.", terminator: " ")
            continue
        }
        
        return number
    }
}

SimpleMath.main()
