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
    var loopMode: LottieLoopMode = .loop
    var playOnce: Bool = false
    var onAnimationComplete: (() -> Void)?

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: filename)
        animationView.contentMode = .scaleAspectFit
        
        if playOnce {
            animationView.loopMode = .playOnce
            animationView.play { finished in
                if finished {
                    onAnimationComplete?() // 애니메이션 종료 시 콜백 호출
                }
            }
        } else {
            animationView.loopMode = loopMode
            animationView.play()
        }
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // 뷰가 업데이트될 때의 작업을 정의할 수 있습니다.
    }
}
