import ArgumentParser

struct taxCalculator: ParsableCommand {
    func run() throws {
        print("Hello Tax Calculator!")
    }
}

taxCalculator.main()
