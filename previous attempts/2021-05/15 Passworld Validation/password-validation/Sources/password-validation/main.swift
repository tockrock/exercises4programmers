import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

struct passwordValidator: ParsableCommand {
    func run() throws {
        let username = ask("What is the username")
        let password = ask("What is the password")
        
        if username == "tockrock" && password == "foo" {
            print("Hello \(username)!")
        } else {
            print("Unrecognized username/password")
        }
        
    }
}

passwordValidator.main()
