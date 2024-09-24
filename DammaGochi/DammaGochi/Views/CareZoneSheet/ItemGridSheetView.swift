//
//  ItemGridSheetView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//


import SwiftUI


struct ItemGridSheetView: View {
    // 그리드 레이아웃: 각 행에 2개의 아이템을 표시하는 레이아웃 설정
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
            Text("상의")
                .font(.caption)
                .bold()
                .padding()
                LazyVGrid(columns: columns, spacing: 20) {
                    // 6개의 아이템을 그리드로 표시
                    ForEach(1...6, id: \.self) { item in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.brown)
                                .frame(height: 100)
                            
                            Text("Item \(item)")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    }
                }
                
                VStack {
                    Text("모자")
                        .font(.caption)
                        .bold()
                        .padding()
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(1...6, id: \.self) { item in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.brown)
                                    .frame(height: 100)
                                
                                Text("Item \(item)")
                                    .foregroundColor(.white)
                                    .font(.headline)
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

