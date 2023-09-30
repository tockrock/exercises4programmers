//
//  ContentView.swift
//  TipCalc
//
//  Created by 鈴木剛 on 2021/05/16.
//

import SwiftUI

struct ContentView {
    @State private var bill = ""
}

extension ContentView: View {
    var body: some View {
        TextField("Billed Amount",
                  text: $bill)
        
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
