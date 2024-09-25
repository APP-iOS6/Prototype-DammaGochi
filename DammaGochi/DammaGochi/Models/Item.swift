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
    var itemNum: Int
    var imageURL: String
}
