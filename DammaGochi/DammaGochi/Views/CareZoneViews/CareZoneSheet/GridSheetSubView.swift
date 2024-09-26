//
//  FeedGridSheetSubView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/25/24.
//

import SwiftUI

struct GridSheetSubView: View {
    @Bindable var itemStore: ItemStores
    let name: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // 헤더 뷰
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brown)
                .frame(height: 30)
            Text(name)
                .font(.caption)
                .foregroundStyle(.white)
                .bold()
                .padding()
        }
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(itemStore.feeds) { item in
                
                Button(action: {
                    // 버튼 클릭 시 동작
                    //item.itemNum -= 1
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.brown)
                            .opacity(0.1)
                            .frame(height: 100)
                        VStack {
                            Text(item.name)
                                .font(.subheadline)
                                .bold()
                                .foregroundStyle(.brown)
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("\(item.itemNum)")
                                .font(.caption)
                                .foregroundStyle(.yellow)
                                .bold()
                            
                        }
                    }
                }
            }
        }
    }
}
