//
//  InputView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import SwiftUI

struct InputView {
    let label: String
    @StateObject var input: Input
}

extension InputView: View {
    var body: some View {
        TextField(label, text: $input.input)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(label: "Length", input: Input())
    }
}
