//
//  HomeView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import AVFoundation
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var pets: [Pet]
    @State private var isShowAR: Bool = false
    @State var addedAnimal: Bool = false
    @State var isShowAddSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isShowAR {
                    ARViewContainer(isShowAR: $isShowAR)
                        .onAppear {
                            requestCameraPermission()
                        }
                        .onDisappear() {
                            isShowAR = false
                        }
                } else {
                    Image("livingroom")
                        .resizable()
                        .scaledToFit()
                }
                
                VStack{
                    HStack() {
                        NavigationLink(destination: PetCreateView()) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .background(Color.brown)
                                .clipShape(Circle()) // 이미지를 원형 버튼으로 만들기
                                .shadow(radius: 5)
                        }
                        .disabled(pets.count >= 2)
                        .padding(.leading, 20)
                        .padding(.top, 40)
                        
                        Spacer()
                    }
                    Spacer()
                    HStack(){
                        Button {
                            isShowAR.toggle()
                        } label: {
                            Image(systemName: "camera.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .background(Color.brown)
                                .clipShape(Circle()) // 이미지를 원형 버튼으로 만들기
                                .shadow(radius: 5)
                        }
                        .padding(.leading, 20)
                        .padding(.bottom, 40)
                        
                        Spacer()
                    }
                }
                
                ZStack {
                    FirstLottieView()
                    
                    if pets.count >= 2 {
                        SecondLottieView()
                    }
                }
            }
            
        }
    }
    
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                print("Access granted")
            } else {
                print("Access denied")
            }
        }
    }
}

struct FirstLottieView: View {
    @State private var draggedOffset: CGSize = .zero
    @State private var accumlatedOffset: CGSize = .zero
    
    var body: some View {
        VStack {
            LottieView(filename: "animationOne")
                .frame(width: 150, height: 150)
                .offset(x: draggedOffset.width, y: draggedOffset.height)
                .gesture(drag)
                .edgesIgnoringSafeArea(.all)
            }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                draggedOffset = accumlatedOffset + gesture.translation
            }
            .onEnded { gesture in
                accumlatedOffset = accumlatedOffset + gesture.translation
            }
    }
}

struct SecondLottieView: View {
    @State private var draggedOffset: CGSize = .zero
    @State private var accumlatedOffset: CGSize = .zero
    
    var body: some View {
        VStack {
            LottieView(filename: "animationFile2")
                .frame(width: 300, height: 300)
                .offset(x: draggedOffset.width, y: draggedOffset.height)
                .gesture(drag)
                .edgesIgnoringSafeArea(.all)
            }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                draggedOffset = accumlatedOffset + gesture.translation
            }
            .onEnded { gesture in
                accumlatedOffset = accumlatedOffset + gesture.translation
            }
    }
}

extension CGSize {
    static func + (lhs: Self, rhs: Self) -> Self {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}

#Preview {
    HomeView()
}
