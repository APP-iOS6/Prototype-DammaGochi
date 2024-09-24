//
//  DammaGochiApp.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import SwiftData

@main
struct DammaGochiApp: App {

    @StateObject var coinManager: CoinManager = CoinManager()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Pet.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            PetCreateView()
        }
        .modelContainer(sharedModelContainer)
        .environmentObject(coinManager)
    }
}
