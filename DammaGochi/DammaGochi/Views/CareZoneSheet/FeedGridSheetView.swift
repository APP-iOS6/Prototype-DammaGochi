//
//  Untitled.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct FeedGridSheetView: View {
    // 그리드 레이아웃: 각 행에 2개의 아이템을 표시하는 레이아웃 설정
    var feeds: [String] = ["사료", "츄르", "고기", "뼈다귀", "소시지", "치킨"]
    var nutrients: [String] = ["비타민", "유산균", "단백질", "포도당", "오메가3", "콜라겐"]
    var num: Int = 10
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .opacity(0.8)
                        .frame(height: 30)
                    Text("사료")
                        .font(.caption)
                        .bold()
                        .padding()
                }
                // 6개의 아이템 그리드
                LazyVGrid(columns: columns, spacing: 20) {
                    // 밥 종류 리스트
                    ForEach(feeds, id: \.self) { item in
                        Button {
                            // 갯수가 줄어들며 밥 먹는 애니메이션
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.brown)
                                    .frame(height: 100)
                                VStack {
                                    Text("\(item)")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .bold()
                                        .padding()
                                    Text("\(num)")
                                        .font(.caption)
                                        .foregroundStyle(.yellow)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                            .opacity(0.8)
                            .frame(height: 30)
                        Text("영양제")
                            .font(.caption)
                            .bold()
                            .padding()
                    }
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(nutrients, id: \.self) { item in
                            Button {
                                // 갯수가 줄어들며 밥 먹는 애니메이션
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.brown)
                                        .frame(height: 100)
                                    VStack {
                                        Text("\(item)")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                            .bold()
                                            .padding()
                                        Text("\(num)")
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
            .padding()
        }
        .presentationDetents([.medium, .large]) // Sheet 크기를 조정 가능
        .navigationTitle("Grid View")
    }
}

