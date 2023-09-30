//
//  CalculationView.swift
//  SimpleMathGUI
//
//  Created by 鈴木剛 on 2021/06/02.
//

import SwiftUI

struct CalculationView {
    let first_number: Double
    let second_number: Double
}

extension CalculationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(first_number) + \(second_number) = \(first_number + second_number)")
            Text("\(first_number) - \(second_number) = \(first_number - second_number)")
            Text("\(first_number) * \(second_number) = \(first_number * second_number)")
            Text("\(first_number) / \(second_number) = \(first_number / second_number)")
        }
    }
}

struct CalculationView_Previews: PreviewProvider {
    
    static var previews: some View {
        CalculationView(first_number: 12, second_number: 3)
    }
}
