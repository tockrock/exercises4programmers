//
//  UnitPickerView.swift
//  Temperature Converter
//
//  Created by 鈴木剛 on 2021/07/08.
//

import SwiftUI

struct UnitPickerView {
    let name: String
    @Binding var selection: Unit
    
}

extension UnitPickerView: View {
    var body: some View {
        Picker(name, selection: $selection) {
            Text("Fahrenheit").tag(Unit.f)
            Text("Celsius").tag(Unit.c)
            Text("Kelvin").tag(Unit.k)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
//
//struct UnitPickerView_Previews: PreviewProvider {
//    @State private var someunit: Unit = Unit.c
//
//    static var previews: some View {
//        UnitPickerView(name: "From Unit", selection: $someunit)
//    }
//}
