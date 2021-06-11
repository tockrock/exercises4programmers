import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askInt(_ question: String) -> Int {
    while true {
        var input = ask(question)
        
        
        return 1
    }
}

struct pizzaParty: ParsableCommand {
    
    func run() throws {
        let people_count = askInt("How many people?")
        
        print("\(people_count) people")
    }
    
}

pizzaParty.main()
