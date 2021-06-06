//
//  ContentView.swift
//  AreaCalculator
//
//  Created by 鈴木剛 on 2021/06/06.
//

import SwiftUI

struct ContentView {
    @StateObject var length = inputHandler()
    @StateObject var width = inputHandler()
    var unit = UnitHandler.meter
    
    var valid: Bool {
        return length.state.valid && width.state.valid
        
    }
    
}

extension ContentView: View {
    var body: some View {
        
        
        VStack {
            TextField("Length", text: $length.input)
            Text(length.state.warning)
                .foregroundColor(length.state.color)
            TextField("Width", text: $width.input)
            Text(width.state.warning)
                .foregroundColor(width.state.color)
            
            VStack {
                Text("Hello World")
                Text("Another Worlds")
            }
            .foregroundColor(valid ? .primary : .clear)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}