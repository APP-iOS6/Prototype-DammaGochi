//
//  Untitled.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct FeedGridSheetView: View {
    var feeds = ItemStores().feeds
    var nutrients = ItemStores().nutrients
//    @State var feeds: [Item] = itemStores.feeds
//    @State var nutrients: [Item] = ItemStores().nutrients
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            GridSheetSubView(items: feeds, name: "사료")
            GridSheetSubView(items: nutrients, name: "영양제")
//                GridSheetSubView(items: nutrients, name: "영양제")
        }
        .presentationDetents([.medium, .large]) // Sheet 크기를 조정 가능
        .padding()
    }
//    .navigationTitle("Grid View")
}
