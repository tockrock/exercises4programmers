import ArgumentParser

struct bmiCalculator: ParsableCommand {
    func run() throws {
        print("Hello BMI Calculator")
    }
}

bmiCalculator.main()
