//
//  InputView.swift
//  AreaCalculator
//
//  Created by 鈴木剛 on 2021/06/06.
//

import SwiftUI

struct InputView {
    let label: String
//    let input: inputHandler
}

extension InputView: View {
    var body: some View {
    
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {

        InputView(label: "Length")
    }
}
