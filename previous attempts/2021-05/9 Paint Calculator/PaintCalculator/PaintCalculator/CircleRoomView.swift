//
//  CircleRoomView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import SwiftUI

struct CircleRoomView {
    @StateObject var radius = Input()
    var valid: Bool {
        radius.valid
    }
    
    var area: Double {
        Double.tau / 2 * pow(radius.value, 2)
    }
    
}

extension CircleRoomView: View {
    var body: some View {
        VStack {
            InputView(label: "Radius", input: radius)
            Divider()
                .padding()
            ResultView(valid: valid, area: area)
            
        }
        .padding()
        
    }
}

struct CircleRoom_Previews: PreviewProvider {
    static var previews: some View {
        CircleRoomView()
    }
}

extension Double {
    static let tau = Double.pi * 2
}
