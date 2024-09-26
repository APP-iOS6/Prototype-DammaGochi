//
//  PetStores.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

@Observable
class PetStores {
    let pets: [Pet]
    
    init () {
        pets = [
            Pet(name: "Yaong", age: 2, gender: "Female", personality: "귀여운 외모에 그렇지 못한 성격", imageStr: "dog"),
            Pet(name: "Kitty", age: 5, gender: "Male", personality: "귀여운 외모에 그렇지 못한 성격", imageStr: "cat"),
        ]
    }
}
