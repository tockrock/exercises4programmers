import ArgumentParser

struct CharacterCounter {}

extension CharacterCounter: ParsableCommand {
    
    mutating func run() throws {
        print("Hello World!")
    }
    
}

CharacterCounter.main()

