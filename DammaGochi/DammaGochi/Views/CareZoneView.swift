//
//  CareZone.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import Lottie

struct CareZoneView: View {
    @State private var energyProgress: Double = 0.0
    @State private var loyaltyProgress: Double = 0.0
    
    @State private var isFeedshow = false
    @State private var isItemshow = false
    
    @State private var currentAnimation = "animationOne" // 기본 애니메이션 파일명
    @State private var isPlayingSecondary = false // 현재 두 번째 애니메이션 재생 중인지 여부
    
    
    var body: some View {
        ZStack {
            Image("PetHouse")
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                HStack {
                    Button {
                        Picker("Pet", selection: $isFeedshow) {
                            Text("Feed").tag(true)
                            Text("Item").tag(false)
                        }
                    } label: {
                        Image("cat")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    .padding()
                    Spacer()
                    Text("Kitty")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                        .padding()
                }
                Spacer()
                
                // Lottie
                LottieView(filename: currentAnimation,
                           loopMode: .loop,
                           playOnce: isPlayingSecondary,
                           onAnimationComplete: {
                    // 애니메이션 재생 완료 시 첫 번째 애니메이션으로 돌아가기
                    currentAnimation = "animationOne"
                    isPlayingSecondary = false
                })
                .frame(width: 300, height: 300)
                .onTapGesture {
                    if !isPlayingSecondary {
                        // 두 번째 애니메이션을 한 번 재생
                        isPlayingSecondary = true
                        currentAnimation = "animationTwo"
                    }
                }
                
                
                // 에너지
                HStack {
                    Image(systemName: "heart.fill")
                    ProgressView(value: energyProgress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .red))
                        .padding()
                }
                .frame(width: 300)
                
                // 충성도
                HStack {
                    Image(systemName: "star.fill")
                    ProgressView(value: loyaltyProgress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
                        .padding()
                }
                .frame(width: 300)
                Spacer()
                
                // 인터랙션
                HStack {
                    Spacer()
                    
                    //밥 주기
                    Button {
                        isFeedshow.toggle()
                    } label: {
                        Image(systemName: "fork.knife.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .background(Color.brown)
                            .clipShape(Circle()) // 이미지를 원형 버튼으로 만들기
                            .shadow(radius: 5)
                    }
                    .sheet(isPresented: $isFeedshow) {
                        FeedGridSheetView() // Sheet에 표시할 뷰
                    }
                    Spacer()
                    
                    // 놀아주기
                    Button {
                        loyaltyProgress += 0.05
                    } label: {
                        Image(systemName: "play.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .background(Color.brown)
                            .clipShape(Circle()) // 이미지를 원형 버튼으로 만들기
                            .shadow(radius: 5)
                    }
                    Spacer()
                    
                    // 꾸미기
                    Button {
                        isItemshow.toggle()
                    } label: {
                        Image(systemName: "hanger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .background(Color.brown)
                            .clipShape(Circle()) // 이미지를 원형 버튼으로 만들기
                            .shadow(radius: 5)
                    }
                    .sheet(isPresented: $isItemshow) {
                        ItemGridSheetView() // Sheet에 표시할 뷰
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CareZoneView()
}

