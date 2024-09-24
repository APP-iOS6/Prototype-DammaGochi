//
//  ContentView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import SwiftData

struct CustomTabView: View {
    //@Environment(\.modelContext) private var modelContext
    //@Query private var pets: [Pet]
    
    var body: some View {

        
        TabView {
            Tab("Home", systemImage: "tray.and.arrow.down.fill") {
                HomeView()
            }
            
            Tab("Game", systemImage: "tray.and.arrow.up.fill") {
                GameView()
            }
            
            Tab("CareZone", systemImage: "person.crop.circle.fill") {
                CareZoneView()
            }
            
            Tab("Store", systemImage: "person.crop.circle.fill") {
                StoreView()
            }
            
            Tab("My", systemImage: "person.crop.circle.fill") {
                MyView()
            }
        }
    }
}

#Preview {
    CustomTabView()
}
