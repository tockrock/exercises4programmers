//
//  Unit.swift
//  AreaCalculator
//
//  Created by 鈴木剛 on 2021/06/06.
//

import Foundation
import SwiftUI

enum Unit {
    case feet
    case meter
}

enum State {
    case empty
    case nonNumerical
    case notPositive
    case correct
    
    var color: Color {
        switch self {
        case .empty, .correct:
            return .clear
        case .nonNumerical, .notPositive:
            return .accentColor
        }
    }
    
    var warning: String {
        switch self {
        case .empty:
            return "Please enter a value"
        case .nonNumerical:
            return "Enter a number"
        case .notPositive:
            return "Enter a positive number"
        case .correct:
            return "Valid Input"
        }
    }
    
    var validation: Bool {
        if self == .correct {
            return true
        }
        return false
    }
        
}


class inputHandler: ObservableObject {
    var input: String = "" {
        didSet {
            validate()
        }
    }
    var value: Double = 0.0
    
    @Published var state: State = .empty
    
    func validate() {
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
