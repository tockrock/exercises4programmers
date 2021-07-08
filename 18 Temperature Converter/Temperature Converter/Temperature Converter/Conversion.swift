//
//  Conversion.swift
//  Temperature Converter
//
//  Created by 鈴木剛 on 2021/07/08.
//

import Foundation

enum Unit: String, CaseIterable, Identifiable {
    case f = "Fahrenheit"
    case c = "Celsius"
    case k = "Kelvin"
    
    var id: String { self.rawValue }
}

func convert(original_temp: Double,
             fromUnit: Unit,
             toUnit: Unit) -> Double {
    
    // convert everything to Celsius first
    let celsius: Double
    switch fromUnit {
    case .f:
        celsius = (original_temp - 32) * 5 / 9
    case .c:
        celsius = original_temp
    case .k:
        celsius = original_temp - 273.15
    }
    
    switch toUnit {
    case .f:
        return (celsius * 9 / 5) + 32
    case .c:
        return celsius
    case .k:
        return celsius + 273.15
    }
    
    
}
