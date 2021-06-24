//
//  principal2TargetView.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/24.
//

import SwiftUI

struct principal2TargetView {
    @State private var principal = Double()
    
    private var experimental = 0.0
    
    static var nf: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }
    
    static var cf: NumberFormatter {
        let cf = NumberFormatter()
        cf.numberStyle = .currency
        return cf
    }
}

extension principal2TargetView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Principal Amount")
            TextField(
                "Double",
                value: $principal,
                formatter: principal2TargetView.cf
            )
            Text(String(principal))
            
            Spacer()
        }
    }
}

struct principal2TargetView_Previews: PreviewProvider {
    static var previews: some View {
        principal2TargetView()
    }
}
