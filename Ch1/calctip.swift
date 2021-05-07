#!/usr/bin/swift
//
//  calctip.swift
//  
//
//  Created by 鈴木剛 on 2021/05/06.
//
import Foundation

//guard let amount = amount else {
//    print("Needs amount.")
//}
//guard let tip = tip else {
//    print("Needs Tip.")
//}
//

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
