//
//  Coin.swift
//  DammaGochi
//
//  Created by Soom on 9/24/24.
//

import Foundation
import SwiftUI

class CoinManager: ObservableObject{
    @Published private(set) var coin: Int = 500
    
    func playGame(){
        self.coin -= 10
    }
    func endGame(){
        self.coin += 100
    }
}
