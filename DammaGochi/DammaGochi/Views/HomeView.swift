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
    @State var scale: CGFloat = 1.0
    @State var isAnimate: Bool = true
    
    var body: some View {
        NavigationStack{
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
                        .ignoresSafeArea(edges: .top)
                }
                
                VStack{
                    HStack (alignment: .center, spacing: 20){
                        NavigationLink(destination: PetCreateView()) {
                            ZStack {
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .scaleEffect(scale)
                                    .foregroundStyle(Color(.systemGray3))
                                    .animation(isAnimate ? .easeInOut(duration: 0.5).repeatForever(autoreverses: true) : .default, value: scale)
                                
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
                        }
                        .onAppear {
                            isAnimate = pets.count == 0 ? true : false
                            scale = isAnimate ? 1.2 : 1.0
                        }
                        if isAnimate{
                            Text("반려동물을 생성해주세요")
                                .foregroundStyle(.white)
                                .font(.title3)
                                .fontWeight(.heavy)
                        }
                        Spacer()
                    }
                    
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
                        Spacer()
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .padding(30)
                
                ZStack {
                    if pets.count > 0 {
                        FirstLottieView()
                    }
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
    @State private var isDragging: Bool = false // 드래그 중인지 확인하는 상태
    @State private var accumlatedOffset: CGSize = .zero
    @State private var position: CGPoint = CGPoint(x: 100, y: 100) // 시작 위치
    @State private var velocity: CGSize = CGSize(width: 0.5, height: 0.5) // 속도
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect() // 타이머

    
    var body: some View {
        VStack {
            LottieView(filename: "animationOne")
                .frame(width: 150, height: 150)
                .position(position)
                .gesture(drag)
                .onReceive(timer) { _ in
                    if !isDragging {
                        moveAnimation(in: UIScreen.main.bounds)
                    }
                }
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    func moveAnimation(in bounds: CGRect) {
        let newPosition = CGPoint(x: position.x + velocity.width, y: position.y + velocity.height)
        
        // 경계 검사 (좌우 및 상하 경계)
        if newPosition.x <= 75 || newPosition.x >= bounds.width - 75 { // 150px 애니메이션 크기의 반
            velocity.width *= -1 // X축 방향 반전
        }
        
        if newPosition.y <= 75 || newPosition.y >= bounds.height - 150 {
            velocity.height *= -1 // Y축 방향 반전
        }

        position = CGPoint(x: position.x + velocity.width, y: position.y + velocity.height)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                isDragging = true
                position = CGPoint(
                    x: gesture.location.x,
                    y: gesture.location.y
                )
            }
            .onEnded { gesture in
                isDragging = false
            }
    }
}

struct SecondLottieView: View {
    @State private var isDragging: Bool = false // 드래그 중인지 확인하는 상태
    @State private var accumlatedOffset: CGSize = .zero
    @State private var position: CGPoint = CGPoint(x: 200, y: 200) // 시작 위치
    @State private var velocity: CGSize = CGSize(width: -0.5, height: 0.5) // 속도
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect() // 타이머

    var body: some View {
        VStack {
            LottieView(filename: "animationFile2")
                .frame(width: 300, height: 300)
                .position(position)
                .gesture(drag)
                .onReceive(timer) { _ in
                    if !isDragging {
                        moveAnimation(in: UIScreen.main.bounds)
                    }
                }
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    func moveAnimation(in bounds: CGRect) {
        let newPosition = CGPoint(x: position.x + velocity.width, y: position.y + velocity.height)
        
        // 경계 검사 (좌우 및 상하 경계)
        if newPosition.x <= 75 || newPosition.x >= bounds.width - 75 { // 150px 애니메이션 크기의 반
            velocity.width *= -1 // X축 방향 반전
        }
        
        if newPosition.y <= 75 || newPosition.y >= bounds.height - 150 {
            velocity.height *= -1 // Y축 방향 반전
        }

        position = CGPoint(x: position.x + velocity.width, y: position.y + velocity.height)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gesture in
                isDragging = true
                position = CGPoint(
                    x: gesture.location.x,
                    y: gesture.location.y
                )
            }
            .onEnded { gesture in
                isDragging = false
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
