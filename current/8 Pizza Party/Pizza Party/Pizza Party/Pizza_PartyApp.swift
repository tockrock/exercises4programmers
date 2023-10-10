//
//  Pizza_PartyApp.swift
//  Pizza Party
//
//  Created by 鈴木剛 on 2023/10/08.
//

import SwiftUI

@main
struct Pizza_PartyApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PrepView()
                    .tabItem {
                        Label("Prepare", systemImage: "pencil.and.list.clipboard")
                    }
                PartyView()
                    .tabItem {
                        Label("Party Time", systemImage: "party.popper")
                    }
            }
        }
    }
}
