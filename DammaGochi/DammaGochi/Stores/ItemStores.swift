//
//  ItemStores.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

@Observable
class ItemStores {
    var feeds: [Item]
    var nutrients: [Item]
    var tops: [Item]
    var caps: [Item]
    var products: [Item]
    
    init() {
        // 밥
        feeds = [
            Item(name: "사료", itemNum: 10, imageName: "Feed", category: .feed),
            Item(name: "츄르", itemNum: 10, imageName: "Chur", category: .feed),
            Item(name: "고기", itemNum: 10, imageName: "Meat", category: .feed),
            Item(name: "뼈다귀", itemNum: 10, imageName: "Bone", category: .feed),
            Item(name: "소시지", itemNum: 10, imageName: "Sausage", category: .feed),
            Item(name: "치킨", itemNum: 10, imageName: "Chicken", category: .feed),
        ]
        // 영양제
        nutrients = [
            Item(name: "비타민", itemNum: 10, imageName: "Vitamin", category: .feed),
            Item(name: "유산균", itemNum: 10, imageName: "Lacto", category: .feed),
            Item(name: "단백질", itemNum: 10, imageName: "Protein", category: .feed),
            Item(name: "포도당", itemNum: 10, imageName: "Sweet", category: .feed),
            Item(name: "오메가", itemNum: 10, imageName: "Omega", category: .feed),
            Item(name: "콜라겐", itemNum: 10, imageName: "Collagen", category: .feed),
        ]
        // 상의
        tops = [
            Item(name: "티셔츠", itemNum: 10, imageName: "Tshirts", category: .cloth),
            Item(name: "후드티", itemNum: 10, imageName: "HoodT", category: .cloth),
            Item(name: "크롭탑", itemNum: 10, imageName: "CropTop", category: .cloth),
            Item(name: "패딩", itemNum: 10, imageName: "Padding", category: .cloth),
            Item(name: "잠옷", itemNum: 10, imageName: "SleepKnit", category: .cloth),
            Item(name: "베스트", itemNum: 10, imageName: "Vest", category: .cloth),
        ]
        // 모자
        caps = [
            Item(name: "야구모자", itemNum: 10, imageName: "BaseballCap", category: .cloth),
            Item(name: "썬캡", itemNum: 10, imageName: "SunCap", category: .cloth),
            Item(name: "니트모자", itemNum: 10, imageName: "KnitCap", category: .cloth),
            Item(name: "방울모자", itemNum: 10, imageName: "BellCap", category: .cloth),
            Item(name: "비니", itemNum: 10, imageName: "Beanie", category: .cloth),
            Item(name: "파일럿 모자", itemNum: 10, imageName: "PilotCap", category: .cloth),
        ]
        
        products = [
            Item(name: "1등급 댕댕이 펫밀크", price: 10, imageName: "petMilk", category: .feed),
            Item(name: "1등급 냥냥이 츄르", price: 10, imageName: "Chur", category: .feed),
            Item(name: "냥냥이 낚시", price: 50, imageName: "catFish", category: .toy),
            Item(name: "댕댕이 공놀이", price: 50, imageName: "dogBall", category: .toy),
            Item(name: "레드 스트라이프 티셔츠", price: 150, imageName: "red", category: .cloth),
            Item(name: "블루 스트라이프 티셔츠", price: 150, imageName: "blue", category: .cloth),
        ]
        
    }
}
