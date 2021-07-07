import ArgumentParser

struct bloodAlcoholCalculator: ParsableCommand {
    func run() throws {
        print("Hello Blood Alcohol Calculator!")
    }
}

bloodAlcoholCalculator.main()
