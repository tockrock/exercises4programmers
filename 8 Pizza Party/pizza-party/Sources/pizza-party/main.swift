import ArgumentParser


struct pizzaParty: ParsableCommand {
    
    func run() throws {
        print("hello world")
    }
    
}

pizzaParty.main()
