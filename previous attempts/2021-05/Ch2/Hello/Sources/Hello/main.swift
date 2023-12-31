import ArgumentParser


struct Hello: ParsableCommand {
    mutating func run() throws {
        print("What is your name?", terminator: " ")
        var name =  readLine() ?? "World"
        
        if name == "" {
            name = "World"
        }
        
        if name == "Takeshi" {
            print("Welcom back, master ;)")
        } else {
            print("Hello \(name), nice to meet you!")
        }
    }
}

Hello.main()
