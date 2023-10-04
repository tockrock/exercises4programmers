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
        let output = attribute.trimmingCharacters(in: .whitespacesAndNewlines) + " says, \"" + quote.trimmingCharacters(in: .whitespacesAndNewlines) + "\""
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
                .foregroundStyle(Color.secondary)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .border(Color.black)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
