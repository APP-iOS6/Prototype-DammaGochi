//
//  Item.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import Foundation

struct Pet: Identifiable {
    var id: UUID = UUID()
    var name: String
    var age: Int
    var gender: String
    var personality: String
    // 프로필 Image 부분
    // 일단은 어싱크 이미지로 주소 넣어놨습니다
    // TODO: 로티에서 이미지 따오기
    var imageStr: String
}
