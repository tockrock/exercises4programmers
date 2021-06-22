import ArgumentParser

struct CurrencyConversion: ParsableCommand {
    func run() throws {
        print("Hello, Currency Conversion")
    }
}

print("Hello, world!")

CurrencyConversion.main()
