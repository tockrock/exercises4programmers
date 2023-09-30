//
//  RectangleRoomView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import SwiftUI

struct RectangleRoomView {
    @StateObject var length = Input()
    @StateObject var width = Input()
    
    var valid: Bool {
        length.valid && width.valid
    }
    
    var area: Double {
        length.value * width.value
    }
}

extension RectangleRoomView: View {
    var body: some View {
        VStack {
            InputView(label: "Length", input: length)
            InputView(label: "Width", input: width)
            
            Divider()
                .padding()
            
            ResultView(valid: valid, area: area)
        }
        .padding()
        
    }
}

struct RectangleRoom_Previews: PreviewProvider {
    static var previews: some View {
        RectangleRoomView()
    }
}
