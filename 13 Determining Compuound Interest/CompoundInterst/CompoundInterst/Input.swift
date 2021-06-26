//
//  Input.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/25.
//

import Foundation

protocol Input: ObservableObject {
    var formatter: Formatter { get }
}

enum State {
    case empty
    case warning
    case alert
    case good
    
    var valid: Bool {
        switch self {
        case .good, .warning:
            return true
        case .empty, .alert:
            return false
        }
    }
}

class StringInput: ObservableObject {
    var input: String = "" {
        didSet {
            verify()
        }
    }
    let decimals: Int
    var value = Double()
    @Published var state: State = .empty
    
    init(decimals: Int) {
        self.decimals = decimals
    }
    
    var valid: Bool {
        state.valid
    }
    
    func verify() {
        guard input.count > 0 else {
            state = .empty
            return
        }
        
        guard let input: Double = Double(input) else {
            state = .alert
            return
        }
        
        let multiplier = pow(10, Double(decimals))
        
        value = floor(input * multiplier) / multiplier
        
        if input == value {
            state = .good
        } else {
            state = .warning
        }
    }
}
