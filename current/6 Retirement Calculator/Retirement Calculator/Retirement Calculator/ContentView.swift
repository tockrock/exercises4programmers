//
//  ContentView.swift
//  Retirement Calculator
//
//  Created by 鈴木剛 on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    @Bindable var model = InputModel()
    
    var body: some View {
        VStack {
            TextField("Current Age", text: $model.ageInput)
            TextField("Retirement Age", text: $model.retirementAgeInput)
            Text(model.output)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
