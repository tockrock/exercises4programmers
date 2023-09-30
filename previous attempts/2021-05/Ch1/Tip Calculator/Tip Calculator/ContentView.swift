//
//  ContentView.swift
//  Tip Calculator
//
//  Created by 鈴木剛 on 2021/05/29.
//

import SwiftUI

struct ContentView {
}

extension ContentView: View {
    var body: some View {
        CalculatorView()
        
    }
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
