//
//  BMIReviewView.swift
//  BMI Calculator
//
//  Created by 鈴木剛 on 2021/07/16.
//

import SwiftUI

struct BMIReviewView {
    var bmi: Double
    
    var healthState: HealthState {
        switch bmi {
        case 25...:
            return .over
        case 18.5..<25:
            return .healthy
        case ..<18.5:
            return .under
        default:
            return .healthy
        }
    }
}

extension BMIReviewView: View {
    var body: some View {
        VStack {
            Text("BMI: \(bmi.description)")
            Text(healthState.notice)
                .foregroundColor(healthState.noticeColor)
        }
    }
}

struct BMIReviewView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BMIReviewView(bmi: 22.2)
            Divider()
            BMIReviewView(bmi: 18.4)
            Divider()
            BMIReviewView(bmi: 25.0)
        }
        
    }
}
