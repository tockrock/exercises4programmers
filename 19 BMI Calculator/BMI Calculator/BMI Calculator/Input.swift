//
//  Input.swift
//  BMI Calculator
//
//  Created by 鈴木剛 on 2021/07/16.
//

import Foundation

enum InputState {
    case empty
    case nonNumerical
    case valid
    
    var valid: Bool {
        return self == .valid
    }
}

class Input: ObservableObject {
    var input: String = ""
    var value: Double = 0.0
    @Published var state: InputState = .empty
    
    var valid: Bool {
        state.valid
    }
    
    private func validate() {
        guard input.count > 0 else {
            value = 0
            state = .empty
            return
        }
        
        guard let input: Double = Double(input) else {
            value = 0
            state = .nonNumerical
            return
        }
        
        value = input
        state = .valid
    }
}
