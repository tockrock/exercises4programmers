//
//  File.swift
//  
//
//  Created by 鈴木剛 on 2021/06/24.
//

import Foundation

func ask(_ question: String, fallback: String = "") -> String {
    print(question, terminator: ": ")
    return readLine() ?? fallback
}

func notPositive() {
    print("Not positive number.", terminator: " ")
}

func askForDouble(_ question: String) -> Double {
    while true {
        let input = ask(question)
        
        guard let input: Double = Double(input) else {
            notPositive()
            continue
        }
        
        guard input > 0 else {
            notPositive()
            continue
        }
        
        return input
    }
}

func askForRoundedInt(_ question: String) -> Int {
    return Int(ceil(askForDouble(question)))
}
