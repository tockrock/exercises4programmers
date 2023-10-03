//
//  ContentView.swift
//  Saying Hello
//
//  Created by 鈴木剛 on 2023/10/02.
//

import SwiftUI
import Observation

@Observable class GreetingModel {
    var name: String = ""
    var greeting: String {
        guard !name.isEmpty else { return " " }
        return "Hello, \(name)! Nice to meet you!"
    }
}

struct ContentView: View {
    @Bindable var model: GreetingModel = GreetingModel()
    
    var body: some View {
        VStack {
            Text(model.greeting)
            TextField("Name", text: $model.name)
        }
        .padding()
    }
}

#Preview() {
    ContentView()
}
