//
//  CareZone.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import Lottie

struct CareZoneView: View {
    @EnvironmentObject var petManager: PetManager
    
    @State private var energyProgress: Double = 0.0
    @State private var loyaltyProgress: Double = 0.0
    @State private var fullProgress: Double = 0.0
    
    @State private var isFeedshow = false
    @State private var isItemshow = false
    
    @State private var currentAnimation = "animationOne" // 기본 애니메이션 파일명
    @State private var isPlayingSecondary = false // 현재 두 번째 애니메이션 재생 중인지 여부
    @State private var isFirstAnimation = true
    @EnvironmentObject var coinManager: CoinManager
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("PetHouse")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    Spacer()
                    HStack(alignment: .center){
                        Text("\(petManager.selectedPet.name)")
                            .foregroundStyle(.white)
                            .font(.title)
                            .bold()
                    }
                    
                    Spacer()
                    
                    // Lottie
                    LottieView(animationName: isFirstAnimation ? "animationOne" : "animationTwo")
                                        .frame(width: 300, height: 300)
                                        .onDisappear {
                                            // 뷰가 사라질 때 실행할 작업
                                            isFirstAnimation = false
                                            print("The view has disappeared!")
                                        }
                    
                    Spacer()
                    // 게이지 - 에너지
                    HStack {
                        VStack {
                            WaterProgressView(title: "에너지", progress: $energyProgress, color: .red)
                            Image(systemName: "flame.fill")
                                .foregroundStyle(Color.red)
                        }
                        .frame(width: 100)
                        
                        // 사랑
                        VStack {
                            WaterProgressView(title: "사랑", progress: $loyaltyProgress, color: .pink)
                            Image(systemName: "heart.fill")
                                .foregroundStyle(Color.yellow)
                        }
                        .frame(width: 100)
                        
                        // 충만함
                        VStack {
                            WaterProgressView(title: "충만함", progress: $fullProgress, color: .orange)
                            Image(systemName: "carrot.fill")
                                .foregroundStyle(Color.red)
                        }
                        .frame(width: 100)
                    }
                    Spacer()
                    
                    // 인터랙션
                    HStack {
                        Spacer()
                        
                        //밥 주기
                        Button {
                            isFeedshow.toggle()
                        } label: {
                            Image(systemName: "fork.knife")
                                .padding(.vertical, 15)
                                .padding(.horizontal,45)
                                .foregroundStyle(.white)
                                .background(.brown.gradient)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom, 10)

                        }
                        .sheet(isPresented: $isFeedshow) {
                            FeedGridSheetView() // Sheet에 표시할 뷰
                        }
                        .presentationDetents([.medium, .large])
                        Spacer()
                        
                        // 놀아주기
                        Button {
                            withAnimation(.easeInOut) {
                                if loyaltyProgress < 1.0 {
                                    loyaltyProgress += 0.05
                                } else {
                                    loyaltyProgress = 0
//                                    coinManager.addCoin()
                                }
                            }
                            isFirstAnimation.toggle()
                        } label: {
                            Image(systemName: "gamecontroller.fill")
                                .padding(.vertical, 15)
                                .padding(.horizontal,45)
                                .foregroundStyle(.white)
                                .background(.brown.gradient)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom, 10)
                        }
                        Spacer()
                        
                        
                        // 꾸미기
                        Button {
                            isItemshow.toggle()
                        } label: {
                            Image(systemName: "hanger")
                                .padding(.vertical, 15)
                                .padding(.horizontal,45)
                                .foregroundStyle(.white)
                                .background(.brown.gradient)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom, 10)
                        }
                        .sheet(isPresented: $isItemshow) {
                            ItemGridSheetView() // Sheet에 표시할 뷰
                        }
                        Spacer()
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink{
                        Text("설정 화면")
                    }label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        HStack{
                            Image("coin")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("\(coinManager.coin)")
                                .font(.caption)
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ProfileView()) {
                        Image(petManager.selectedPet.imageStr)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}


#Preview {
    CareZoneView()
}

