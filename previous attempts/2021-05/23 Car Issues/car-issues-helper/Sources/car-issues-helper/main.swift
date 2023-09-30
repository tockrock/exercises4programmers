import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askBool(_ question: String) -> Bool {
    while true {
        let input = ask(question + " (yn)")
        
        switch input {
        case "y":
            return true
        case "n":
            return false
        default:
             continue
        }
    }
}

struct questionStruct {
    let question = ""
    let yes = ""
    let no = ""
    let answer = ""
}

struct CarIssuesHelper: ParsableCommand {
    func run() throws {
        
        let first_answer = askBool("Is the car silent when you turn the key?")
        print("Hello Car Issues Helper \(first_answer)")
    }
}

CarIssuesHelper.main()
