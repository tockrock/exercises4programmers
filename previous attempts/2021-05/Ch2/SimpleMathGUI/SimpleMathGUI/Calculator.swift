//
//  Calculator.swift
//  SimpleMathGUI
//
//  Created by 鈴木剛 on 2021/06/02.
//

import Foundation
import SwiftUI

class numberInput: ObservableObject {
    var input: String = "" {
        didSet {
            checkState()
        }
    }
    @Published var state: inputState = .emptyString
    var number: Double = 0
    
    func checkState() {
        guard input != "" else {
            self.state = .emptyString
            return
        }
        guard let number: Double = Double(self.input) else {
            self.state = .nonNumericalNumber
            return
        }
        guard number > 0 else {
            self.state = .negativeNumber
            return
        }
        
        self.number = number
        self.state = .correct
    }
}

enum inputState {
    case correct
    case emptyString
    case nonNumericalNumber
    case negativeNumber
    
    var warning: String {
        switch self {
        case .correct:
            return "Your number is correct!"
        case .emptyString:
            return "Please Enter something"
        case .nonNumericalNumber:
            return "Please Enter a Number"
        case .negativeNumber:
            return "Please Enter a Positive Number"
        }
    }
    
    var color: Color {
        switch self {
        case .correct:
            return .clear
        case .emptyString:
            return .secondary
        case .nonNumericalNumber, .negativeNumber:
            return .red
        }
    }
}
