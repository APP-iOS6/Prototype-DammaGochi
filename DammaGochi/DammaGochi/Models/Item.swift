//
//  Item.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct Item: Identifiable {
    var id: UUID = UUID()
    var name: String
    var itemNum: Int = 0
    var price: Int = 10
    var imageName: String
    var category: String = ""
    //let imageName: String
}

