import ArgumentParser

struct madLib {
}

func ask(question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}


extension madLib: ParsableCommand {
    
    func run() throws {
        let noun = ask(question: "Enter a noun")
        let verb = ask(question: "Enter a verb")
        let adjective = ask(question: "Enter an adjective")
        let adverb = ask(question: "Enter an adverb")
        
        print("Do you \(verb) your \(adjective) \(noun) \(adverb)? Haha!")
        
    }
}

madLib.main()
