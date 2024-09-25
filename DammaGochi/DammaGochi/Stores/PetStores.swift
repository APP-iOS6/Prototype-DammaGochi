//
//  PetStores.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct PetStores {
    let pets: [Pet]
    
    init () {
        pets = [
            Pet(name: "Dog", age: 2, gender: "Female", personality: "귀여운 외모에 그렇지 못한 성격", imageStr: "dog"),
            Pet(name: "Cat", age: 5, gender: "Male", personality: "귀여운 외모에 그렇지 못한 성격", imageStr: "cat"),
        ]
    }
}
