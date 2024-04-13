//
//  ContentView.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        TabView {
            HomeBuilder().build().tabItem {
                Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "house") }
                )
            }
            
            InfoPage().tabItem {
                Label(
                    title: { Text("Info") },
                    icon: { Image(systemName: "info.circle")  }
                )
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
