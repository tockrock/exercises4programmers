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
    
    var length: Double? { Double(lenghtInput) }
    var width: Double? { Double(widthInput) }
    
    var output: String {
        guard let length, let width, 
              0 < length, 0 < width else {
            return "Please fill positive numbers in the fields above."
        }

        let unitLength = Measurement(value: length, unit: UnitLength.feet)
        let unitWidth = Measurement(value: width, unit: UnitLength.feet)
        let area = length * width
        let areaSqFeet = Measurement(value: area, unit: UnitArea.squareFeet)
        let areaSqMeter = areaSqFeet.converted(to: .squareMeters)
        
        return """
        You entered dimention of \(unitLength) by \(unitWidth).
        
        The area is
        \(areaSqFeet)
        \(areaSqMeter)
        """
        
    }
}


struct ContentView: View {
    @Bindable var model = RoomModel()
    
    var body: some View {
        VStack {
            TextField("Length", text: $model.lenghtInput)
            TextField("Width", text: $model.widthInput)
            Text(model.output)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
