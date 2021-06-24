//
//  principal2TargetView.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/24.
//

import SwiftUI

struct principal2TargetView {
    @State private var principal = Double()
    
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
            
            Text(result)
            
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
