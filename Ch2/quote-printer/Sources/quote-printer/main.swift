import ArgumentParser

struct QuotePrinter {
    
}

extension QuotePrinter: ParsableCommand {
    mutating func run() throws {
        print("Hello, world!")
    }
    
}

QuotePrinter.main()

