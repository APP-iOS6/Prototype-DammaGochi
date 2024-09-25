//
//  Untitled.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct FeedGridSheetView: View {
    var itemStores = ItemStores()
//    @State var feeds: [Item] = itemStores.feeds
    @State var nutrients: [Item] = ItemStores().nutrients
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            GridSheetSubView(itemStore: itemStores, name: "사료")
            GridSheetSubView(itemStore: itemStores, name: "사료")
//                GridSheetSubView(items: nutrients, name: "영양제")
        }
        .presentationDetents([.medium, .large]) // Sheet 크기를 조정 가능
        .padding()
    }
//    .navigationTitle("Grid View")
}
