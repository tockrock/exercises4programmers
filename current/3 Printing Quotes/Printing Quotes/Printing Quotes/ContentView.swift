//
//  ContentView.swift
//  Printing Quotes
//
//  Created by 鈴木剛 on 2023/10/04.
//

import SwiftUI
import Observation

@Observable class QuoteModel {
    var quote: String = ""
    var attribute: String = ""
    
    var attributed_quote: String {
        guard !attribute.isEmpty && !quote.isEmpty else {
            return " "
        }
        let output = attribute + " says, \"" + quote + "\""
        return output
    }
}


struct ContentView: View {
    @Bindable var model: QuoteModel = QuoteModel()
    
    var body: some View {
        VStack {
            TextField("Quote", text: $model.quote)
            TextField("By", text: $model.attribute)
            Text(model.attributed_quote)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
