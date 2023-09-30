//
//  principal2TargetView.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/24.
//

import Foundation
import SwiftUI

struct principal2TargetView {
    @StateObject private var principal = StringInput(decimals: 2)
    @StateObject private var rate = StringInput(decimals: 1)
    @StateObject private var years = StringInput(decimals: 0)
    @StateObject private var compounds = StringInput(decimals: 0)
    
    private var amount: Double {
        principal.value * pow((1 + (rate.value / 100) / compounds.value), compounds.value * years.value)
    }
    
    private var result: String {
        if valid {
            return cf.string(from: NSNumber(value: amount))!
        }
        
        return cf.string(from: NSNumber(value: 0))!
    }
    
    private var valid: Bool {
        principal.valid && rate.valid && years.valid && compounds.valid
    }
    
}

extension principal2TargetView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            FormField(label: "Principal Amount", input: principal)
            
            FormField(label: "Annual Rate", input: rate)
            
            FormField(label: "Years to Invest", input: years)
            FormField(label: "Compounds per year", input: compounds)
            
            Divider()
                .padding(.vertical)
            
            Text("\(result)")
                .foregroundColor(valid ? .primary : .secondary)
            
            Spacer()
            
        }
        .padding()
    }
}

struct principal2TargetView_Previews: PreviewProvider {
    static var previews: some View {
        principal2TargetView()
    }
}
