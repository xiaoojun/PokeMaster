//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by 汤小军 on 2020/3/23.
//  Copyright © 2020 汤小军. All rights reserved.
//

import SwiftUI

struct PokemonInfoRow: View {
//    let model = PokemonViewModel.sample(id: 1)
    let model: PokemonViewModel
    let expanded: Bool
    var body: some View {
        VStack {
            HStack {
                Image("Pokemon-\(model.id)")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 4)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(model.nameEN)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 12)
            Spacer()
            
            HStack(spacing: expanded ? 20 : -30) {
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "star").modifier(ToolButtonModifier())
                        
                }
                Button(action: {}) {
                    Image(systemName: "chart.bar").modifier(ToolButtonModifier())
                }
                Button(action: {}) {
                    Image(systemName: "info.circle").modifier(ToolButtonModifier())
                }
            }
            .padding(.bottom, 12)
            .opacity(expanded ? 1 : 0.0)
            .frame(maxHeight: expanded ? .infinity : 0)
            .padding(.top, 12)
        }
        .frame(height: expanded ? 120 : 80)
        .padding(.trailing, 12)
        .padding(.leading, 23)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 20).stroke(model.color, style: StrokeStyle(lineWidth: 4))
                
                RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [.white, model.color]), startPoint: .leading, endPoint: .trailing))
            }
        )
        .padding(.horizontal)
            //动画方式
            .animation(.default)
            //隐式动画
//            .animation(Animation.linear(duration: 0.5).delay(0.2).repeatForever(autoreverses: true))
//        .onTapGesture {
//            self.expanded.toggle()
            //显示动画
//            withAnimation(.spring(response: 0.05, dampingFraction: 0.425, blendDuration: 0)) {
//                self.expanded.toggle()
//            }
//            withAnimation {
//
//                 self.expanded.toggle()
//            }
//        }
        
    }
}

struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            PokemonInfoRow(model: .sample(id: 1), expanded: false)
            PokemonInfoRow(model: .sample(id: 21), expanded: false)
            PokemonInfoRow(model: .sample(id: 25), expanded: true)
        }
//        PokemonInfoRow()
    }
}


struct ToolButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.system(size: 25))
        .foregroundColor(.white)
        .frame(width: 30, height: 30)
    }
}
