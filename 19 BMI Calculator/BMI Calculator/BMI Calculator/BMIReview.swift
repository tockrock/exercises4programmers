//
//  BMIReview.swift
//  BMI Calculator
//
//  Created by 鈴木剛 on 2021/07/16.
//

import Foundation
import SwiftUI

enum HealthState: String {
    case under
    case healthy
    case over
}

extension HealthState {
    var notice: String {
        switch self {
        case .over:
            return "You are overweight.\nYou should see your doctor."
        case .healthy:
            return "You are within the ideal weight range.\nGood Job!"
        case .under:
            return "You are underweight.\nYou should see your doctor."
        }
        
    }
    
    var noticeColor: Color {
        if self == .healthy {
            return .primary
        }
        
        return .red
    }
}

