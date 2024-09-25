//
//  GamePlayView.swift
//  DammaGochi
//
//  Created by Soom on 9/24/24.
//

import SwiftUI

struct GamePlayView: View {
    @EnvironmentObject var coinManager: CoinManager
    @Binding var gameComplted: Bool
    @State var isGameEnd: Bool = false
    @State private var isAppear: Bool = false
    var body: some View {
        VStack{
            Text(isGameEnd ? "게임 종료!" : "게임 시작!")
                .onAppear{
                    isAppear = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        isGameEnd.toggle()
                    }
                }
                .onDisappear{
                    coinManager.playGame()
                }
                .navigationDestination(isPresented: $isGameEnd){
                    GameView()
                        .navigationBarBackButtonHidden(true)
                }
            GameCompleteView(showCircle: $isAppear)
        }
    }
}

#Preview {
    GamePlayView(gameComplted: .constant(false))
}
