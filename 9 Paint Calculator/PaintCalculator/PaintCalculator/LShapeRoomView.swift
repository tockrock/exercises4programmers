//
//  LShapeRoomView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import SwiftUI

struct LShapeRoomView {
    @StateObject var longLength = Input()
    @StateObject var longWidth = Input()
    @StateObject var shortLength = Input()
    @StateObject var shortWidth = Input()
    
    var valid: Bool {
        longLength.valid &&
            longWidth.valid &&
            shortLength.valid &&
            shortWidth.valid
    }
    
    var area: Double {
        longLength.value * longWidth.value -
            shortLength.value * shortWidth.value
    }
}

extension LShapeRoomView: View {
    var body: some View {
        VStack {
            InputView(label: "Long Length", input: longLength)
            InputView(label: "Long Width", input: longWidth)
            InputView(label: "Short Length", input: shortLength)
            InputView(label: "Short Width", input: shortWidth)
            Divider()
                .padding()
            ResultView(valid: valid, area: area)
        }
        
    }
}

struct LShapeRoomView_Previews: PreviewProvider {
    static var previews: some View {
        LShapeRoomView()
    }
}
