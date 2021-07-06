import ArgumentParser

struct passwordValidator: ParsableCommand {
    func run() throws {
        print("Hello Password Validator!")
    }
}

passwordValidator.main()
