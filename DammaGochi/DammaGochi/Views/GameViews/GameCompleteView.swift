//
//  GameCompleteView.swift
//  DammaGochi
//
//  Created by Soom on 9/24/24.
//

import SwiftUI

struct GameCompleteView: View {
    @State var isAnimating: Bool = false
    @State private var rotateCircle = false
    @EnvironmentObject var coinManager: CoinManager
    @Binding var showCircle: Bool
    
    var body: some View {
        VStack {
            if showCircle {
                Image("coin")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fit)
                    .offset(y: isAnimating ? -UIScreen.main.bounds.height / 2 + 350 : UIScreen.main.bounds.height / 2)
                    .rotation3DEffect(
                        .degrees(rotateCircle ? 360 : 0),
                           axis: (x: 0.0, y: 1.0, z: 0.0),
                           anchor: .center,
                           anchorZ: 0,
                           perspective: 1)
                    .animation(.easeInOut(duration: 0.8), value: isAnimating)
                    .animation(.linear(duration: 1).delay(0.5), value: rotateCircle)
                
                    .onAppear {
                        isAnimating = true
                        coinManager.endGame()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            rotateCircle = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            rotateCircle = false
                            isAnimating = false
                            showCircle = false
                        }
                    }
            }
        }
    }
}


#Preview {
    GameCompleteView(showCircle: .constant(false))
}
