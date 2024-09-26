import SwiftUI
import Lottie

// LottieView: UIViewRepresentable을 사용해 Lottie 애니메이션을 SwiftUI에서 사용 가능하도록 래핑
struct LottieView: UIViewRepresentable {
    var animationName: String
    var loopMode: LottieLoopMode = .loop

    // Coordinator를 사용하여 animationView를 관리
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        // LottieAnimationView 초기화 및 설정
        let animationView = LottieAnimationView(name: animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        // animationView를 Coordinator에 저장
        context.coordinator.animationView = animationView

        // animationView를 UIView에 추가
        view.addSubview(animationView)

        // AutoLayout 설정
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // animationName이 변경되었을 때 animationView 업데이트
        if let animationView = context.coordinator.animationView {
            animationView.stop()
            animationView.animation = LottieAnimation.named(animationName)
            animationView.loopMode = loopMode
            animationView.play()
        }
    }

    // Coordinator 클래스 정의
    class Coordinator {
        var animationView: LottieAnimationView?
    }
}
