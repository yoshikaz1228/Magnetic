//
//  ContentView.swift
//  Magnetic
//
//  Created by Yoshikaz Matsubara on 2022/08/07.
//  Copyright © 2022 efremidze. All rights reserved.
//

import SwiftUI
import UIKit

struct MagneticViewController: UIViewRepresentable {
    
    @Binding var nodes: [Node]
    
    func makeUIView(context: Context) -> MagneticView {
        let bounds = UIScreen.main.bounds
        let width = Int(bounds.width)
        let height = Int(bounds.height)
        
        let magneticView = MagneticView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        for node in nodes {
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
