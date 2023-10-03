//
//  ContentView.swift
//  Character Counter
//
//  Created by 鈴木剛 on 2023/10/03.
//

import SwiftUI
import Observation

@Observable class InputModel {
    var input: String = ""
    var output: String {
        guard !input.isEmpty else {
            return "Please enter a text below"
        }
        return "\(input) has \(input.count) characters."
    }
}

struct ContentView: View {
    @Bindable var model: InputModel = InputModel()
    
    var body: some View {
        VStack {
            Text(model.output)
                .foregroundStyle(.secondary)
            TextField("Text", text: $model.input)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
