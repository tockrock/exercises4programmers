//
//  Rounding.swift
//  Tip Calculator
//
//  Created by 鈴木剛 on 2021/05/30.
//

import SwiftUI

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
