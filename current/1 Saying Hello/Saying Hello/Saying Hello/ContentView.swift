//
//  ContentView.swift
//  Saying Hello
//
//  Created by 鈴木剛 on 2023/10/02.
//

import SwiftUI
import Observation

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview("light") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}

@Observable class GreetingModel {
    var name: String = ""
    var greeting: String {
        guard !name.isEmpty else { return "" }
        return "Hello, \(name)! Nice to meet you!"
    }
}
