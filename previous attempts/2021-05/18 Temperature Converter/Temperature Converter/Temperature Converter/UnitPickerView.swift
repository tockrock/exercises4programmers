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
            ForEach(Unit.allCases) { unit in
                Text(unit.rawValue).tag(unit)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct UnitPickerView_Previews: PreviewProvider {
    @State static var someunit = Unit.f

    static var previews: some View {
        UnitPickerView(name: "From Unit", selection: $someunit)
    }
}
