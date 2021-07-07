import ArgumentParser

let drivingAge = 16

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askInt(_ question: String) -> Int {
    while true {
        let input = ask(question)
        
        guard let input: Int = Int(input) else {
            continue
        }
        
        guard input > 0 else {
            continue
        }
        
        return input
    }
}

struct legalDrivingAge: ParsableCommand {
    func run() throws {
        let age = askInt("What is your age?")
        
        print("Your age is \(age)")
    }
}

legalDrivingAge.main()
