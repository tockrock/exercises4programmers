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
    
    var actual: UnitLength {
        switch self {
        case .feet:
            return .feet
        case .meter:
            return .meters
        }
    }
    
    var areaUnit: UnitArea {
        switch self {
        case .feet:
            return .squareFeet
        case .meter:
            return .squareMeters
        }
    }
    
    var convertUnit: UnitArea {
        switch self {
        case .feet:
            return .squareMeters
        case .meter:
            return .squareFeet
        }
    }
    
    func wrap(_ value: Double) -> Measurement<UnitLength> {
        return Measurement(value: value, unit: self.actual)
    }

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
    
    var valid: Bool {
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
