//
//  principal2TargetView.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/24.
//

import SwiftUI

struct principal2TargetView {
    @State private var date = Date()
    @State private var double = Double()
    @State private var integer = Int()
    
    static var df: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .short
        return df
    }
    
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
        VStack {
            TextField(
                "Date",
                value: $date,
                formatter: principal2TargetView.df)
            Text(date.debugDescription)
            TextField(
                "Double",
                value: $double,
                formatter: principal2TargetView.cf
            )
            Text("\(double)")
        }
    }
}

struct principal2TargetView_Previews: PreviewProvider {
    static var previews: some View {
        principal2TargetView()
    }
}
