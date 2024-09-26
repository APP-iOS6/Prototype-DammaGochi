//
//  FeedGridSheetSubView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/25/24.
//

import SwiftUI

struct GridSheetSubView: View {
    var items: [Item]
    @State private var showImage = false
    let name: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // 헤더 뷰
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.brown)
                .frame(height: 30)
            Text(name)
                .font(.caption)
                .foregroundStyle(.white)
                .bold()
        }

        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(items) { item in
                
                Button(action: {
                    // 버튼 클릭 시 동작
                    //item.itemNum -= 1
//                    withAnimation(.easeInOut(duration: 1.0)) {
//                        showImage.toggle()
//                    }
//                    item.itemNum -= 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.easeInOut) {
                            showImage = false
                        }
                    }
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
//            if showImage {
//                Image("snack")
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(.yellow)
//                    .opacity(showImage ? 1 : 0)
//                    .offset(x: -130, y: -200) // 좌측 하단에서 위로 이동
//                    .animation(.spring(response: 0.6, dampingFraction: 0.6))
//                    .animation(.easeInOut(duration: 1.0), value: showImage)
//            }
        }
    }
}
