//
//  calculator.swift
//  Retirement Calculator
//
//  Created by 鈴木剛 on 2023/10/05.
//

import Foundation
import Observation

@Observable class InputModel {
    var ageInput = ""
    var retirementAgeInput = ""
    
    private var age: Int? { Int(ageInput) }
    private var retirementAge: Int? { Int(retirementAgeInput) }
    
    var output: String {
        guard let age, let retirementAge else {
            return "Please enter the field above correctly"
        }
        
        let remaing = retirementAge - age
        
        guard remaing > 0 else {
            return "You can already retire!"
        }
        
        return """
               You have \(remaing) years left until you can retire
               It's \(Date.now.year), so you can retire in \(Date.now.year + remaing).
               """
    }
    
}

extension Date {
    var year: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("YYYY")
        
        return Int(dateFormatter.string(from: self))!
    }
    
}
