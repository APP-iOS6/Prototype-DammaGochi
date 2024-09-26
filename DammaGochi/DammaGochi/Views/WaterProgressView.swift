//
//  WaterProgressView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/26/24.
//
import SwiftUI

struct WaterProgressView: View {
    @State var title: String
    @Binding var progress: Double
    @State var color: Color

    var body: some View {
        VStack {
            ZStack {
                // 배경 원 (회색)
                Circle()
                    .fill(.white)
                    .opacity(0.3)
                    .frame(width: 50, height: 50)

                // 물이 차오르는 것처럼 보이게 하는 그라데이션 원
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.yellow, color]), startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 50, height: 50)
                    .mask(
                        // 진행도에 따라 원이 수평으로 채워지는 효과
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 50, height: 50 * progress) // 진행도에 따른 높이 조정
                            .offset(y: 50 * (1 - progress) / 2) // 진행도에 따른 위치 조정
                    )

                // 퍼센티지 텍스트
                Text(String(format: "%.0f%%", progress * 100))
                    .font(.caption)
                    .bold()
            }
            .frame(width: 50, height: 50)

        }
    }
}
