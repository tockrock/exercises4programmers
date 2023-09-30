import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard let input: Double = Double(input) else {
            continue
        }
        
        guard input > 0 else {
            continue
        }
        
        return input
    }
}

func getAlcoholDistributionRatio() -> Double {
    while true {
        let input = ask("Are you a male or a female? (m/f)")
        
        switch input {
        case "m":
            return 0.73
        case "f":
            return 0.66
        default:
            continue
        }
    }
}

struct bloodAlcoholCalculator: ParsableCommand {
    func run() throws {
        
        let alcohol = askDouble("How many alcohol did you consume? (oz)")
        let weight = askDouble("How much do you weight? (pounds)")
        let adr = getAlcoholDistributionRatio()
        let time = askDouble("How many hours has it been since you last drank?")
        
        let bac = (alcohol * 5.14/weight * adr) - 0.15 * time
        
        print("Your BAC is \(bac)")
        
        if bac >= 0.08 {
            print("It is not legal for you to drive")
        }
    }
}

bloodAlcoholCalculator.main()
