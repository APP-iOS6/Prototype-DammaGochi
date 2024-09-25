//
//  ARViewController.swift
//  DammaGochi
//
//  Created by 최승호 on 9/24/24.
//

import SwiftUI
import ARKit
import UIKit

// ARKit 뷰 컨트롤러를 SwiftUI에 맞게 래핑하는 뷰
struct ARViewContainer: UIViewControllerRepresentable {
    @Binding var isShowAR: Bool
    
    func makeUIViewController(context: Context) -> ARViewController {
        let arViewController = ARViewController()
        arViewController.isShowAR = isShowAR
        return arViewController
    }

    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
        if isShowAR {
            uiViewController.startARSession()
        } else {
            uiViewController.pauseARSession()
        }
    }
}

class ARViewController: UIViewController {
    var sceneView: ARSCNView!
    var isShowAR: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ARSCNView 설정
        sceneView = ARSCNView(frame: view.bounds)
        sceneView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(sceneView)
        
        if isShowAR {
            // 카메라 피드 시작
            startARSession()
        }
    }
    
    func startARSession() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        sceneView.session.run(configuration)
    }
    
    func pauseARSession() {
        sceneView.session.pause()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // AR 세션 일시 중단
        sceneView.session.pause()
    }
}
