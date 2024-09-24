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
                Spacer()
                HStack(spacing: 20){
                    Button(action: {
                        isShowAR.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.cyan)
                                .frame(width: 50, height: 50)
                            Image(systemName: "web.camera")
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
