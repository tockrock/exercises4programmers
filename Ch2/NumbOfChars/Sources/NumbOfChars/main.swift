import ArgumentParser

struct CharacterCounter {}

extension CharacterCounter: ParsableCommand {
    
    mutating func run() throws {
        print("What is the input string?:", terminator: " ")
        let input = readLine() ?? ""
        
        if input.count > 0 {
            print("\(input) has \(input.count) characters.")
        } else {
            print("You must enter a something for the word count")
        }
    }
    
}

CharacterCounter.main()

