//
//  LottieView.swift
//  DammaGochi
//
//  Created by 홍지수 on 9/24/24.
//

import SwiftUI
import Lottie

// Lottie 애니메이션을 표시하는 커스텀 뷰
struct LottieView: UIViewRepresentable {
    var filename: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: filename)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop // 애니메이션을 반복 재생
        animationView.play()
        
        animationView.loopMode = .autoReverse

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        // 제약조건 설정
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // 필요 시 업데이트 로직
    }
}
