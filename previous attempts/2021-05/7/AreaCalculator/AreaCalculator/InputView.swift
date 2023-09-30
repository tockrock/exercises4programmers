//
//  InputView.swift
//  AreaCalculator
//
//  Created by 鈴木剛 on 2021/06/06.
//

import SwiftUI

struct InputView {
    let label: String
    @StateObject var input: inputHandler
}

extension InputView: View {
    var body: some View {
    
        VStack {
            TextField(label, text: $input.input)
            Text(input.state.warning)
                .foregroundColor(input.state.color)
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {

        InputView(label: "Length", input: inputHandler())
    }
}
