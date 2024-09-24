//
//  CareZone.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI

struct CareZoneView: View {
    @State private var energyProgress: Double = 0.3
    @State private var loyaltyProgress: Double = 0.5

    @State private var isFeedshow = false
    @State private var isItemshow = false
    
    var body: some View {
        HStack {
//            Picker("Pet", selection: $isFeedshow) {
//                Text("Feed").tag(true)
//                Text("Item").tag(false)
//            }
            
            Text("Cat Name")
                .font(.title).bold()
        }
        
        // Lottie
        LottieView(filename: "animationFile") // 애니메이션 파일명 설정
            .frame(width: 300, height: 300)
            .padding()
        
        
        // 에너지
        HStack {
            Image(systemName: "heart.fill")
            ProgressView(value: energyProgress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .red))
                .padding()
        }
        
        // 충성도
        HStack {
            Image(systemName: "star.fill")
            ProgressView(value: loyaltyProgress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
                .padding()
        }
        
        // 인터랙션
        HStack {
            Button {
                isFeedshow.toggle()
            } label: {
                Image(systemName: "fork.knife")
            }
            .buttonStyle(.bordered)
            .background(Color.brown)
            .sheet(isPresented: $isFeedshow) {
                FeedGridSheetView() // Sheet에 표시할 뷰
            }
            
            Button {
                
            } label: {
                Image(systemName: "play.house")
            }
            .buttonStyle(.bordered)
            .background(Color.brown)
            
            Button {
                isItemshow.toggle()
            } label: {
                Image(systemName: "hanger")
            }
            .buttonStyle(.bordered)
            .background(Color.brown)
            .sheet(isPresented: $isItemshow) {
                ItemGridSheetView() // Sheet에 표시할 뷰
            }

        }
        
        
    }
}
