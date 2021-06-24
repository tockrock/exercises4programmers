//
//  principal2TargetView.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/24.
//

import SwiftUI

struct principal2TargetView {
    @State private var principal = Double()
    @State private var rate = Double()
    @State private var years = Double()
    @State private var compounds = Double()
    
    private var amount: Double {
        principal * 2
    }
    
    private var result: String {
        cf.string(from: NSNumber(value: amount))!
    }
    
}

extension principal2TargetView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Principal Amount")
            TextField(
                "Double",
                value: $principal,
                formatter: cf
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.trailing)
            
            Text("Annual Rate")
            TextField(
                "Rate",
                value: $rate,
                formatter: nf
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.trailing)
            
            Text("Years to Invest")
            TextField(
                "Years",
                value: $years,
                formatter: nf
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.trailing)
            
            Text("Compounds per year")
            TextField(
                "Compounds",
                value: $compounds,
                formatter: nf
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.trailing)
            
            Divider()
            
            Text(result)
            
        }
        .padding()
    }
}

struct principal2TargetView_Previews: PreviewProvider {
    static var previews: some View {
        principal2TargetView()
    }
}
