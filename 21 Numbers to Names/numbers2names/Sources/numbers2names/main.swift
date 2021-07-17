import ArgumentParser

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func askForLanguage(from languages: [String]) -> String {
    while true {
        let input = ask("Which Language? (\(languages.joined(separator: ", ")))")
        
        guard languages.contains(input) else { continue }
        
        return input
    }
}

let months = [
    "English": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
    "Spanish": ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"]

]

func askForTheMonth() -> Int {
    while true {
        let input = ask("Please enter the number of the month")
        
        guard let input: Int = Int(input) else { continue }
        guard input > 0 else { continue }
        guard input < 13 else { continue }
        
        return input
    }
}

struct NumbersToMonths: ParsableCommand {
    func run() throws {
        let numeralMonth = askForTheMonth()
        let languages = Array(months.keys)
        let language = askForLanguage(from: languages)
        guard let localizedMonths = months[language] else {
            print("something terrible has happened.")
            return
        }
        let month = localizedMonths[numeralMonth - 1]
        print("The name of the month is \(month)")
    }
}

NumbersToMonths.main()
