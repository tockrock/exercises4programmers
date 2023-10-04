//
//  ContentView.swift
//  Mad Lib
//
//  Created by 鈴木剛 on 2023/10/04.
//

import SwiftUI
import Observation

@Observable class StoryModel {
    var noun = ""
    var verb = ""
    var adjective = ""
    var adverb = ""
    
    var result: String {
        guard
            !noun.isEmpty,
            !verb.isEmpty,
            !adjective.isEmpty,
            !adverb.isEmpty else {
            return " "
        }
        return "Do you \(verb) your \(adjective) \(noun) \(adverb)? That's Hilarious!"
    }
}

struct ContentView: View {
    @Bindable var model = StoryModel()
    
    var body: some View {
        VStack {
            TextField("Noun", text: $model.noun)
            TextField("Verb", text: $model.verb)
            TextField("Adjective", text: $model.adjective)
            TextField("Adverb", text: $model.adverb)
            Text(model.result)
                .frame(maxWidth: .infinity)
                .padding()
                .border(Color.black)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
