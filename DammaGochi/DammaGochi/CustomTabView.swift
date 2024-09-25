//
//  ContentView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import SwiftData

struct CustomTabView: View {
    @Query private var pets: [Pet]
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.circle.fill") {
                HomeView()
            }
            Tab("CareZone", systemImage: "pawprint.circle.fill") {
                CareZoneView()
            }
            Tab("Game", systemImage: "gamecontroller.circle.fill") {
                GameView()
            }

            Tab("Store", systemImage: "storefront.circle.fill") {
                StoreView()
            }
        }
    }
}

#Preview {
    CustomTabView()
}
