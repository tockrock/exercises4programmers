//
//  ContentView.swift
//  PaintCalculator
//
//  Created by 鈴木剛 on 2021/06/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RectangleRoomView()
                .tabItem {
                    Label("Rectangle Room",
                          systemImage: "rectangle")
                }
            CircleRoomView()
                .tabItem {
                    Label("Circle Room",
                          systemImage: "circle")
                }
            LShapeRoomView()
                .tabItem {
                    Label("L-Shaped Room", systemImage: "square.split.bottomrightquarter")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
