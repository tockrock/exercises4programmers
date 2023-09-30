import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForDouble(_ question: String, except previous: Set<Double> = []) -> Double? {
    while true {
        let input = ask(question)
        
        guard input.count > 0 else { return nil }
        guard let input: Double = Double(input) else { continue }
        guard !previous.contains(input) else { continue }
        
        return input
    }
}

func largerOf(_ first: Double, and second: Double) -> Double {
    if first > second { return first }
    return second
}

struct CompareNumbers: ParsableCommand {
    func run() throws {
        var numbers: Set<Double> = []
        while true {
            let input = askForDouble("Enter the \(numbers.count + 1) number", except: numbers)
            guard let input = input else {
                guard !numbers.isEmpty else { continue }
                break
            }
            
            numbers.insert(input)
        }
        
        var max = numbers.removeFirst()

        while !numbers.isEmpty {
            max = largerOf(max, and: numbers.removeFirst())
        }
        
        print("The largest number you've entered is \(max)")
    }
}

CompareNumbers.main()
