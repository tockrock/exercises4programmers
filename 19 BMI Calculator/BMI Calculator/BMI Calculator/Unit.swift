//
//  Unit.swift
//  BMI Calculator
//
//  Created by 鈴木剛 on 2021/07/16.
//

enum Unit {
    case height
    case weight
}

extension Unit {
    var min: Double {
        switch self {
        case .height: return 100
        case .weight: return 40
        }
    }
    
    var max: Double {
        switch self {
        case .height: return 200
        case .weight: return 100
        }
    }
    
    var unit: String {
        switch self {
        case .height: return "cm"
        case .weight: return "kg"
        }
    }
}
