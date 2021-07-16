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
    static func review(bmi: Double) -> HealthState {
        switch bmi {
        case 25...:
            return .over
        case 18.5..<25:
            return .healthy
        case ..<18.5:
            return .under
        default:
            // Something has gone wrong, but going to ignore it for now.
            return .healthy
        }
    }

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

