//
//  MainTab.swift
//  PokeMaster
//
//  Created by 汤小军 on 2020/3/27.
//  Copyright © 2020 汤小军. All rights reserved.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
        TabView {
            PokemonRootView().tabItem {
                Image(systemName: "list.bullet.below.rectangle")
                Text("列表")
            }
            
            SettingRootView().tabItem {
                Image(systemName: "gear")
                Text("设置")
            }
        }
//        .edgesIgnoringSafeArea(.top)
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
