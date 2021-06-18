//
//  RectangleRoomView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import SwiftUI

struct RectangleRoom {
    @StateObject var length = Input()
    @StateObject var width = Input()
    
    var valid: Bool {
        length.valid && width.valid
    }
}

extension RectangleRoom: View {
    var body: some View {
        VStack {
            InputView(label: "Length", input: length)
            InputView(label: "Width", input: width)
            
            Divider()
                .padding()
            
            HStack {
                Text("Area:")
                    .foregroundColor(valid ? .primary : .secondary)
                Text("\(length.value * width.value)")
                    .foregroundColor(valid ? .primary : .clear)
                Spacer()
            }
        }
        .padding()
        
    }
}

struct RectangleRoom_Previews: PreviewProvider {
    static var previews: some View {
        RectangleRoom()
    }
}
