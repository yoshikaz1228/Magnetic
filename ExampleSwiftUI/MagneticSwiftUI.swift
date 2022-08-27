//
//  MagneticSwiftUI.swift
//  ExampleSwiftUI
//
//  Created by Yoshikaz Matsubara on 2022/08/13.
//

import SwiftUI
import Magnetic

struct MagneticSwiftUI: UIViewRepresentable {
    
    @Binding var nodes: [Node]
    
    func makeUIView(context: Context) -> MagneticView {
        let bounds = UIScreen.main.bounds
        
        let magneticView = MagneticView(frame: bounds)
        for node in nodes {
            node.setBubble(bubble: true)
            magneticView.magnetic.addChild(node)
        }
        return magneticView
    }
    
    func updateUIView(_ uiView: MagneticView, context: Context) {
        for child in uiView.magnetic.children {
            if let node = child as? Node {
                if(node.isBubble()) {
                    child.removeFromParent()
                }
            }
        }
        
        for node in nodes {
            uiView.magnetic.addChild(node)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator {
        
    }
}
