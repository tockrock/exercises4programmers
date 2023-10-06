//
//  ContentView.swift
//  Area of a Rectangular Room
//
//  Created by 鈴木剛 on 2023/10/06.
//

import SwiftUI
import Observation

let sqFeet2Meter = 0.09290304

@Observable class RoomModel {
    var lenghtInput = ""
    var widthInput = ""
    
    var length: Int? { Int(lenghtInput) }
    var width: Int? { Int(widthInput) }
    
    var output: String {
        guard let length,
              let width else {
            return "Please fill the fields above"
        }
        
        return """
        You entered dimention of \(length) feet by \(width) feet.
        The area is
        
        \(length * width) square feet
        \(Double(length * width) * sqFeet2Meter) square meters
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
