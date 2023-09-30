//
//  Rounding.swift
//  Tip Calculator
//
//  Created by 鈴木剛 on 2021/05/30.
//

import SwiftUI

enum Percision {
    case ones
    case hundredths
}

func roundWithPercision(_ value: Double, percision: Percision) -> Double {
    let multipler: Double
    
    switch percision {
    case .ones:
        multipler = 1
    case .hundredths:
        multipler = 100
    }
    
    return round(value * multipler) / multipler
}

@propertyWrapper
struct Rounding {
    private var value: Double = 0
    
    var wrappedValue: Double {
        get {
            value
        }
        set {
            value = (newValue * 10).rounded() / 10
        }
    }
    
    init(wrappedValue initialValue: Double) {
        self.wrappedValue = initialValue
    }
    
}


