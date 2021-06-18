//
//  Input.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import Foundation

enum InputState {
    case empty
    case nonNumerical
    case notPositive
    case correct
    
    var valid: Bool {
        return self == .correct
    }
}

class Input: ObservableObject {
    var input: String = "" {
        didSet {
            validate()
        }
    }
    var value: Double = 0
    
    @Published var state: InputState = .empty
    
    private func validate() {
        guard input.count > 0 else {
            state = .empty
            return
        }
        
        guard let input: Double = Double(input) else {
            state = .nonNumerical
            return
        }
        
        guard input > 0 else {
            state = .notPositive
            return
        }
        
        value = input
        state = .correct
    }
}
