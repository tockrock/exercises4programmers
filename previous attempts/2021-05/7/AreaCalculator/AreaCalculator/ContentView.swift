//
//  ContentView.swift
//  AreaCalculator
//
//  Created by 鈴木剛 on 2021/06/06.
//

import SwiftUI

struct ContentView {
    @State private var unit: UnitHandler = .meter
    @StateObject var length = inputHandler()
    @StateObject var width = inputHandler()
    
    var valid: Bool {
        return length.state.valid && width.state.valid
        
    }
    
}

extension ContentView: View {
    var body: some View {
        VStack {
            Picker("Unit", selection: $unit) {
                Text("Meter").tag(UnitHandler.meter)
                Text("Feet").tag(UnitHandler.feet)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom)
            
            InputView(label: "Length", input: length)
            InputView(label: "Width", input: width)
            
            let area = Area(value: width.value * length.value, unit: unit)
            VStack {
                Text("Area is: \(area.baseArea.description)")
                Text("Converted to: \(area.convertedArea.description)")
            }
            .foregroundColor(valid ? .primary : .clear)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
