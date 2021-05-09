func main() {
    print("What is the amount?")
    let priceInput = readLine() ?? ""
    print("What is the percentage for the tip?")
    let tipInput = readLine() ?? ""

    let price = Double(priceInput)
    let tip = Double(tipInput)

    let tipAmount = price! * tip! * 0.01
    let total = price! + tipAmount

    print("tip is \(tipAmount)")
    print("total  is \(total)")
}

main()
