//
//  ConversionView.swift
//  Temperature Converter
//
//  Created by 鈴木剛 on 2021/07/08.
//

import SwiftUI

struct ConversionView {
    @State private var fromUnit: Unit = .c
    @State private var toUnit: Unit = .f
    
    @StateObject var fromTemp: Input
}

extension ConversionView: View {
    var body: some View {
        VStack {
            
            UnitPickerView(name: "From", selection: $fromUnit)
            TextField("Original Temperature", text: $fromTemp.input)
            Divider()
            
            UnitPickerView(name: "To", selection: $toUnit)
            Text(String(convert(original_temp: fromTemp.value, fromUnit: fromUnit, toUnit: toUnit)))

        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView(fromTemp: Input())
    }
}
