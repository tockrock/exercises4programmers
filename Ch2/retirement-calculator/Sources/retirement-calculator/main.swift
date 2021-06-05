import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

struct retirementCalculator: ParsableCommand {
    
    func run() throws {
        print("New World!")
    }
    
}

retirementCalculator.main()
