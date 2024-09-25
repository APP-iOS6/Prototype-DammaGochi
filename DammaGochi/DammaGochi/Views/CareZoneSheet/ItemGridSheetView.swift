//
//  ItemGridSheetView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//


import SwiftUI


struct ItemGridSheetView: View {
    @State var tops: [Item] = ItemStores().tops
    @State var caps: [Item] = ItemStores().caps
    // 그리드 레이아웃: 각 행에 2개의 아이템을 표시하는 레이아웃 설정
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                GridSheetSubView(items: tops, name: "상의")
                GridSheetSubView(items: caps, name: "모자")
            }
            .padding()
        }
        .presentationDetents([.medium, .large]) // Sheet 크기를 조정 가능
        .navigationTitle("Grid View")
    }
}

