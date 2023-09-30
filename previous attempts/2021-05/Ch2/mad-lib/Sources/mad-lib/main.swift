import ArgumentParser

struct madLib {
}

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}


extension madLib: ParsableCommand {
    
    func run() throws {
        let noun = ask("Enter a noun")
        let verb = ask("Enter a verb")
        let adjective = ask("Enter an adjective")
        let adverb = ask("Enter an adverb")
        
        print("Do you \(verb) your \(adjective) \(noun) \(adverb)? Haha!")
        
    }
}

madLib.main()
