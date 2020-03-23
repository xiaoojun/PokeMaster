//
//  BlurView.swift
//  PokeMaster
//
//  Created by 汤小军 on 2020/3/23.
//  Copyright © 2020 汤小军. All rights reserved.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
 
    let style: UIBlurEffect.Style
    
    init(style: UIBlurEffect.Style) {
        print("Init")
        self.style = style
    }
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        
        print("makeUIView")
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
         print("updateUIView")

    }
}

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            
            BlurView(style: style)
            self
        }
    }
}
