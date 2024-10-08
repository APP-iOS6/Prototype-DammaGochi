//
//  FeedGridSheetSubView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/25/24.
//

import SwiftUI

struct GridSheetSubView: View {
    let items: [Item]
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
            ForEach(items) { item in
                Button(action: {
                    // 버튼 클릭 시 동작
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
//                                .padding()
                            Image(item.imageURL)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("\(item.itemNum)")
                                .font(.caption)
                                .foregroundStyle(.yellow)
                                .bold()
//                                .padding()
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    FeedGridSheetSubView(items: <#T##[Item]#>, name: "")
//}
