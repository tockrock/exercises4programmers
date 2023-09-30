//
//  ContentView.swift
//  Number Counter
//
//  Created by 鈴木剛 on 2021/06/02.
//

import SwiftUI

struct ContentView {
    @State var target_string: String = ""
}

extension ContentView: View {
    var body: some View {
        VStack {
            TextField("Enter string", text: $target_string)
            
            if target_string.count > 0 {
                Text("\(target_string) is \(target_string.count) Characters")
            } else {
                Text("Please Enter Text")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
