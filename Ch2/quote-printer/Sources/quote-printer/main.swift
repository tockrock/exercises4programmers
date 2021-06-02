import ArgumentParser

func ask(question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

struct QuotePrinter {
    var quotes: [Quote] = load("quotes.json")
}

func printQuote(_ quote: Quote) {
    printQuote(quote.quote, by: quote.by)
    
}

func printQuote(_ quote: String, by quote_by: String) {
    print("\(quote_by) says, \"\(quote)\"")
}

extension QuotePrinter: ParsableCommand {
    mutating func run() throws {
        
        for quote in quotes {
            printQuote(quote)
        }
        
        let quote = ask(question: "What is the Quote?")
        let by = ask(question: "Who said it?")

        printQuote(quote, by: by)
    }
    
}

QuotePrinter.main()

