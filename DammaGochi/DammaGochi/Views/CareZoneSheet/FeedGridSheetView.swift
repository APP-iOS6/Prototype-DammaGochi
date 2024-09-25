//
//  Untitled.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct FeedGridSheetView: View {
    var feeds: [Item] = ItemStores().feeds
    var nutrients: [Item] = ItemStores().nutrients
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                headerView("사료")
                // 6개의 아이템 그리드
                feedItemsGrid(feeds)
                //                LazyVGrid(columns: columns, spacing: 20) {
                //                    // 밥 종류 리스트
                //                    ForEach(0..<feeds.count - 1, id: \.self) { index in
                //                        Button {
                //                            // 갯수가 줄어들며 밥 먹는 애니메이션
                //                        } label: {
                //                            ZStack {
                //                                RoundedRectangle(cornerRadius: 10)
                //                                    .fill(Color.brown)
                //                                    .opacity(0.1)
                //                                    .frame(height: 100)
                //                                VStack {
                //                                    Text("\(feeds[index].name)")
                //                                        .foregroundColor(.white)
                //                                        .font(.headline)
                //                                        .bold()
                //                                        .padding()
                //                                    Image("\(feeds[index].imageURL)")
                //                                        .frame(width: 30, height: 30)
                //                                    Text("\(feeds[index].num)")
                //                                        .font(.caption)
                //                                        .foregroundStyle(.yellow)
                //                                        .padding()
                //                                }
                //                            }
                //                        }
                //                    }
                
                
                headerView("영양제")
                feedItemsGrid(nutrients)
                //                    LazyVGrid(columns: columns, spacing: 20) {
                //                        ForEach(0..<nutrients.count - 1, id: \.self) { index in
                //                            Button {
                //                                // 갯수가 줄어들며 밥 먹는 애니메이션
                //                            } label: {
                //                                ZStack {
                //                                    RoundedRectangle(cornerRadius: 10)
                //                                        .fill(Color.brown)
                //                                        .opacity(0.1)
                //                                        .frame(height: 100)
                //                                    VStack {
                //                                        Text("\(nutrients[index].name)")
                //                                            .foregroundColor(.white)
                //                                            .font(.headline)
                //                                            .bold()
                //                                            .padding()
                //                                        Image("\(nutrients[index].imageURL)")
                //                                            .frame(width: 30, height: 30)
                //                                        Text("\(nutrients[index].num)")
                //                                            .font(.caption)
                //                                            .foregroundStyle(.yellow)
                //                                            .padding()
                //                                    }
                //                                }
                //                            }
                //                        }
                //                    }
            }
        }
        .padding()
    }
    /*.presentationDetents([.medium, .large])*/ // Sheet 크기를 조정 가능
    //.navigationTitle("Grid View")
}



// FeedGridSheetView 확장: 재사용 가능한 컴포넌트를 분리
extension FeedGridSheetView {
    // 헤더 뷰
    @ViewBuilder
    func headerView(_ name: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .opacity(0.3)
                .frame(height: 30)
            Text(name)
                .font(.caption)
                .bold()
                .padding()
        }
    }
    
    // 그리드 항목
    @ViewBuilder
    func feedItemsGrid(_ itemArray: [Item]) -> some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(0..<itemArray.count, id: \.self) { index in
                Button(action: {
                    // 버튼 클릭 시 동작
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.brown)
                            .opacity(0.1)
                            .frame(height: 100)
                        VStack {
                            Text(itemArray[index].name)
                                .font(.headline)
                                .padding()
                            Image(itemArray[index].imageURL)
                                .frame(width: 30, height: 30)
                            Text("\(itemArray[index].num)")
                                .font(.caption)
                                .foregroundStyle(.yellow)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}
