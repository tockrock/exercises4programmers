import ArgumentParser

struct temperatureConverter: ParsableCommand {
    func run() throws {
        print("Hello Temperature Converter!")
    }
}

temperatureConverter.main()
