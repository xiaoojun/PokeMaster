//
//  ContentView.swift
//  PokeMaster
//
//  Created by 汤小军 on 2020/3/22.
//  Copyright © 2020 汤小军. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Button(action: {
                     
                }) {
                    Text("搜索")
                }.padding(.leading, 16)
                PokemonList().navigationBarTitle("宝可梦列表")
            }


        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
