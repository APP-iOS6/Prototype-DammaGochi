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
                        print("add animal")
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

#Preview {
    HomeView()
}
