//
//  ConversionView.swift
//  Temperature Converter
//
//  Created by 鈴木剛 on 2021/07/08.
//

import SwiftUI

struct ConversionView {
    @State private var fromUnit: Unit = .c
    @State private var toUnit: Unit = .k
}

extension ConversionView: View {
    var body: some View {
        VStack {
            Picker("From Unit", selection: $fromUnit) {
                Text("Fahrenheit").tag(Unit.f)
                Text("Celsius").tag(Unit.c)
                Text("Kelvin").tag(Unit.k)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            UnitPickerView(name: "From Unit", selection: $fromUnit)
            UnitPickerView(name: "To Unit", selection: $toUnit)

            Text("You've selected")
        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
