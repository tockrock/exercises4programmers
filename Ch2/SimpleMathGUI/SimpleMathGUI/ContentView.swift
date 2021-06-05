//
//  ContentView.swift
//  SimpleMathGUI
//
//  Created by 鈴木剛 on 2021/06/02.
//

import SwiftUI

struct ContentView {
    @StateObject var firstInput = numberInput()
    @StateObject var secondInput = numberInput()
    
    var bothValid: Bool {
        guard firstInput.state == .correct else {
            return false
        }
        guard secondInput.state == .correct else {
            return false
        }
        
        return true
    }

    
}

extension ContentView: View {
    var body: some View {
        VStack {
            TextField("First Number", text: $firstInput.input)
            Text(firstInput.state.warning)
                .foregroundColor(firstInput.state.color)
            
            TextField("Second Number", text: $secondInput.input)
            Text(secondInput.state.warning)
                .foregroundColor(secondInput.state.color)
            
            CalculationView(first_number: firstInput.number, second_number: secondInput.number)
                .foregroundColor(bothValid ? Color.secondary : Color.clear)

        }
        .padding()
        
        
        
    }
}

struct ContentView_Preview: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
