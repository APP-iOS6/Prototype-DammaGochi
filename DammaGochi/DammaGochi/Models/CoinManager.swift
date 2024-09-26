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
    
    func storeCoin(price: Int) {
            if coin >= price {
                coin -= price
            }
        }
}

class PetManager: ObservableObject {
    var examplePets: [Pet] = [Pet(name: "Kitty", age: 5, gender: "♀", personality: "매우 귀엽게 생긴 외모에 그렇지 못한 성격입니다...!", imageStr: "cat"), Pet(name: "Yaong", age: 2, gender: "♂", personality: "고양이인척 하는 토끼입니다...!", imageStr: "blue")]
    
    @Published var selectedPet: Pet
    
    init() {
        self.selectedPet = examplePets.first!
    }
}
