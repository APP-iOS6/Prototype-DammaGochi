//
//  File.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI


struct GameView: View {
    let gridItem = Array(repeating: GridItem(.flexible()), count: 2)
    let gameImageName: [String] = ["game1", "game2", "game3", "game4","game5","game6"]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItem) {
                ForEach(gameImageName, id: \.self) { gameImageName in
                    Image(gameImageName)
                        .resizable()
                        .frame(height: 300)
                        .aspectRatio(contentMode: .fit)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal,10)
    }
}


#Preview {
    GameView()
}
