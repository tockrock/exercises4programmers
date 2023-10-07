//
//  ContentView.swift
//  Area of a Rectangular Room
//
//  Created by 鈴木剛 on 2023/10/06.
//

import SwiftUI
import Observation

@Observable class RoomModel {
    var lenghtInput = ""
    var widthInput = ""
    var unitIsMeter: Bool = true
}

extension RoomModel {
    private var length: Double? { Double(lenghtInput) }
    private var width: Double? { Double(widthInput) }
    
    private var selectedLengthUnit: UnitLength {
        unitIsMeter ? UnitLength.meters : UnitLength.feet
    }
    private var selectedAreaUnit: UnitArea {
        unitIsMeter ? UnitArea.squareMeters : UnitArea.squareFeet
    }
    private var convertedAreaUnit: UnitArea {
        unitIsMeter ? UnitArea.squareFeet : UnitArea.squareMeters
    }

    var output: String {
        guard let length, let width,
              0 < length, 0 < width else {
            return "Please fill positive numbers in the fields above."
        }

        let unitLength = Measurement(value: length, unit: selectedLengthUnit)
        let unitWidth = Measurement(value: width, unit: selectedLengthUnit)
        let area = length * width
        let unitArea = Measurement(value: area, unit: selectedAreaUnit)
        let convertedUnitArea = unitArea.converted(to: convertedAreaUnit)
        
        let result = """
            You entered dimention of \(unitLength) by \(unitWidth).
            
            The area is
            \(unitArea)
            \(convertedUnitArea)
            """
        return result
    }
}


struct ContentView: View {
    @Bindable var model = RoomModel()
    
    var body: some View {
        VStack {
            Picker("Unit", selection: $model.unitIsMeter) {
                Text("Meter").tag(true)
                Text("Feet").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            
            TextField("Length", text: $model.lenghtInput)
            TextField("Width", text: $model.widthInput)
            
            Divider()
                .padding(.vertical)
            
            Text(model.output)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
