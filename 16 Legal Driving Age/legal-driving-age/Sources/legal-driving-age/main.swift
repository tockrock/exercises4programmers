import ArgumentParser

let drivingAge = 16

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForValidAge() {
    print("Please enter valid age.", terminator: " ")
}

func askAge(_ question: String) -> Int {
    while true {
        let input = ask(question)
        
        guard let input: Int = Int(input) else {
            askForValidAge()
            continue
        }
        
        guard input > 0 else {
            askForValidAge()
            continue
        }
        
        return input
    }
}

struct legalDrivingAge: ParsableCommand {
    func run() throws {
        let age = askAge("What is your age?")
        
        age >= drivingAge ? print("Your are old enough to legally drive.") : print("You are not old enough to legally drive")
    }
}

legalDrivingAge.main()
