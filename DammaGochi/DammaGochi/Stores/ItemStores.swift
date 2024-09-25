//
//  ItemStores.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

@Observable
class ItemStores {
    let feeds: [Item]
    let nutrients: [Item]
    let tops: [Item]
    let caps: [Item]
    
    init() {
        // 밥
        feeds = [
            Item(name: "사료", itemNum: 10, imageURL: "Feed"),
            Item(name: "츄르", itemNum: 10, imageURL: "Chur"),
            Item(name: "고기", itemNum: 10, imageURL: "Meat"),
            Item(name: "뼈다귀", itemNum: 10, imageURL: "Bone"),
            Item(name: "소시지", itemNum: 10, imageURL: "Sausage"),
            Item(name: "치킨", itemNum: 10, imageURL: "Chicken"),
        ]
        // 영양제
        nutrients = [
            Item(name: "비타민", itemNum: 10, imageURL: "Vitamin"),
            Item(name: "유산균", itemNum: 10, imageURL: "Lacto"),
            Item(name: "단백질", itemNum: 10, imageURL: "Protein"),
            Item(name: "포도당", itemNum: 10, imageURL: "Sweet"),
            Item(name: "오메가", itemNum: 10, imageURL: "Omega"),
            Item(name: "콜라겐", itemNum: 10, imageURL: "Collagen"),
        ]
        // 상의
        tops = [
            Item(name: "티셔츠", itemNum: 10, imageURL: "Tshirts"),
            Item(name: "후드티", itemNum: 10, imageURL: "HoodT"),
            Item(name: "크롭탑", itemNum: 10, imageURL: "CropTop"),
            Item(name: "패딩", itemNum: 10, imageURL: "Padding"),
            Item(name: "잠옷", itemNum: 10, imageURL: "SleepKnit"),
            Item(name: "베스트", itemNum: 10, imageURL: "Vest"),
        ]
        // 모자
        caps = [
            Item(name: "야구모자", itemNum: 10, imageURL: "BaseballCap"),
            Item(name: "썬캡", itemNum: 10, imageURL: "SunCap"),
            Item(name: "니트모자", itemNum: 10, imageURL: "KnitCap"),
            Item(name: "방울모자", itemNum: 10, imageURL: "BellCap"),
            Item(name: "비니", itemNum: 10, imageURL: "Beanie"),
            Item(name: "파일럿 모자", itemNum: 10, imageURL: "PilotCap"),
        ]
        
    }
}
