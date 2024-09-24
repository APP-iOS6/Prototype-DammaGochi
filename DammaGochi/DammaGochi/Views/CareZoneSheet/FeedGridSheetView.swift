//
//  Untitled.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI


struct FeedGridSheetView: View {
    // 그리드 레이아웃: 각 행에 2개의 아이템을 표시하는 레이아웃 설정
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            Text("밥")
            LazyVGrid(columns: columns, spacing: 20) {
                // 12개의 아이템을 그리드로 표시
                ForEach(1...12, id: \.self) { item in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(height: 100)
                        
                        Text("Item \(item)")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
            }
            .padding()
        }
        .presentationDetents([.medium, .large]) // Sheet 크기를 조정 가능
        .navigationTitle("Grid View")
    }
}

