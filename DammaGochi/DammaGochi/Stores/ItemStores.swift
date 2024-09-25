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
    let nutrients: [Item]
    let tops: [Item]
    let caps: [Item]
    let products: [Item]
    
    init() {
        // 밥
        feeds = [
            Item(name: "사료", itemNum: 10, imageName: "Feed"),
            Item(name: "츄르", itemNum: 10, imageName: "Chur"),
            Item(name: "고기", itemNum: 10, imageName: "Meat"),
            Item(name: "뼈다귀", itemNum: 10, imageName: "Bone"),
            Item(name: "소시지", itemNum: 10, imageName: "Sausage"),
            Item(name: "치킨", itemNum: 10, imageName: "Chicken"),
        ]
        // 영양제
        nutrients = [
            Item(name: "비타민", itemNum: 10, imageName: "Vitamin"),
            Item(name: "유산균", itemNum: 10, imageName: "Lacto"),
            Item(name: "단백질", itemNum: 10, imageName: "Protein"),
            Item(name: "포도당", itemNum: 10, imageName: "Sweet"),
            Item(name: "오메가", itemNum: 10, imageName: "Omega"),
            Item(name: "콜라겐", itemNum: 10, imageName: "Collagen"),
        ]
        // 상의
        tops = [
            Item(name: "티셔츠", itemNum: 10, imageName: "Tshirts"),
            Item(name: "후드티", itemNum: 10, imageName: "HoodT"),
            Item(name: "크롭탑", itemNum: 10, imageName: "CropTop"),
            Item(name: "패딩", itemNum: 10, imageName: "Padding"),
            Item(name: "잠옷", itemNum: 10, imageName: "SleepKnit"),
            Item(name: "베스트", itemNum: 10, imageName: "Vest"),
        ]
        // 모자
        caps = [
            Item(name: "야구모자", itemNum: 10, imageName: "BaseballCap"),
            Item(name: "썬캡", itemNum: 10, imageName: "SunCap"),
            Item(name: "니트모자", itemNum: 10, imageName: "KnitCap"),
            Item(name: "방울모자", itemNum: 10, imageName: "BellCap"),
            Item(name: "비니", itemNum: 10, imageName: "Beanie"),
            Item(name: "파일럿 모자", itemNum: 10, imageName: "PilotCap"),
        ]
        
        products = [
            Item(name: "1등급 댕댕이 펫밀크", price: 10, imageName: "petMilk", category: "간식"),
            Item(name: "1등급 냥냥이 츄르", price: 10, imageName: "Chur", category: "간식"),
            Item(name: "냥냥이 낚시", price: 50, imageName: "catFish", category: "장난감"),
            Item(name: "댕댕이 공놀이", price: 50, imageName: "dogBall", category: "장난감"),
            Item(name: "레드 스트라이프 티셔츠", price: 150, imageName: "red", category: "의류"),
            Item(name: "블루 스트라이프 티셔츠", price: 150, imageName: "blue", category: "의류"),
        ]
        
    }
}
