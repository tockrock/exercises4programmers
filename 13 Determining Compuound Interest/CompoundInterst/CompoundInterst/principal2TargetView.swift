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
            Text(cf.string(from: NSNumber(value: principal * 2))!)
            
            Spacer()
        }
    }
}

struct principal2TargetView_Previews: PreviewProvider {
    static var previews: some View {
        principal2TargetView()
    }
}
