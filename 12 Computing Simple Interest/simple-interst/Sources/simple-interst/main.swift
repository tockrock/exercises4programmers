import ArgumentParser


struct SimpleInterest: ParsableCommand {
    func run() throws {
        print("Hello Simple Interst")
    }
}

print("Hello, world!")

SimpleInterest.main()
