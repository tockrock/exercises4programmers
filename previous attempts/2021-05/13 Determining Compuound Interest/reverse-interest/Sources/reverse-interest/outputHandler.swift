//
//  File.swift
//  
//
//  Created by 鈴木剛 on 2021/06/24.
//

import Foundation

enum outputOption {
    case currency
    case percent
}

func output(_ amount: Double, as option: outputOption) -> String {
    let formatter = NumberFormatter()
    switch option {
    case .currency:
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
    case .percent:
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
    }
    return formatter.string(from: NSNumber(value: amount))!
}
