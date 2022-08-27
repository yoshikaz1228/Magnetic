//
//  ContentView.swift
//  ExampleSwiftUI
//
//  Created by Yoshikaz Matsubara on 2022/08/07.
//  Copyright © 2022 efremidze. All rights reserved.
//

import SwiftUI
import Magnetic

struct ContentView: View {
    @State var nodes: [Node] = []
    
    var body: some View {
        MagneticSwiftUI(nodes: $nodes).onAppear {
            nodes.append(Node(text: "Italy", image: UIImage(named: "italy"), color: .red, radius: 30))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
