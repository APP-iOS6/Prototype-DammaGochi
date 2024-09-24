//
//  HomeView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State private var isShowAR: Bool = false
    @State private var addedAnimal: Bool = false
    
    var body: some View {
        ZStack {
            if isShowAR {
                ARViewContainer(isShowAR: $isShowAR)
                    .onAppear {
                        requestCameraPermission()
                    }
                    .onDisappear() {
                        isShowAR = false
                    }
            }
            
            VStack{
                HStack() {
                    Button(action: {
                        addedAnimal = true
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                    Spacer()
                }
                Spacer()
                HStack(){
                    Button(action: {
                        isShowAR.toggle()
                    }) {
                        ZStack {
                            Image(systemName: "camera.rotate")
                                .font(.largeTitle)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                    Spacer()
                }
            }
            
            HStack {
                FirstLottieView()
                
                if addedAnimal {
                    SecondLottieView()
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
            LottieView(filename: "animationFile")
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

extension CGSize {
    static func + (lhs: Self, rhs: Self) -> Self {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}

#Preview {
    HomeView()
}
