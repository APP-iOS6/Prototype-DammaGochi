//
//  Item.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

enum category: String {
    case all = "전체"
    case feed = "간식"
    case toy = "장난감"
    case cloth = "의류"
    case other = "기타용품"
}

struct Item: Identifiable {
    var id: UUID = UUID()
    var name: String
    var itemNum: Int = 10
    var price: Int = 10
    var imageName: String
    var category: category = .feed
    //let imageName: String
}

