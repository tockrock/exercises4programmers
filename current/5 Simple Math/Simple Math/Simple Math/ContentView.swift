//
//  ContentView.swift
//  Simple Math
//
//  Created by 鈴木剛 on 2023/10/04.
//

import SwiftUI
import Observation

@Observable class InputModel {
    var firstInput = "" {
        didSet {
            firstNumber = Int(firstInput)
        }
    }
    var secondInput = "" {
        didSet {
            secondNumber = Int(secondInput)
        }
    }
    
    private(set) var firstNumber: Int? = nil
    private(set) var secondNumber: Int? = nil

}

struct ContentView: View {
    @Bindable var model = InputModel()
    
    var body: some View {
        VStack {
            TextField("First Number", text: $model.firstInput)
            TextField("Second Number", text: $model.secondInput)
            
            if let first = model.firstNumber,
               let second = model.secondNumber {
                Text("""
                     \(first) + \(second) = \(first + second)
                     \(first) - \(second) = \(first - second)
                     \(first) * \(second) = \(first * second)
                     \(first) / \(second) = \(Double(first) / Double(second))
                     """)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
