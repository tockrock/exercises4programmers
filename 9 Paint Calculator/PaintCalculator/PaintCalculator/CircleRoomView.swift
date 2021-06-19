//
//  CircleRoomView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import SwiftUI

struct CircleRoom {
    @StateObject var radius = Input()
    var valid: Bool {
        radius.valid
    }
    
    var area: Double {
        Double.tau / 2 * pow(radius.value, 2)
    }
    
}

extension CircleRoom: View {
    var body: some View {
        VStack {
            InputView(label: "Radius", input: radius)
            Divider()
                .padding()
            AreaView(valid: valid, area: area)
            
        }
        
    }
}

struct CircleRoom_Previews: PreviewProvider {
    static var previews: some View {
        CircleRoom()
    }
}

extension Double {
    static let tau = Double.pi * 2
}
