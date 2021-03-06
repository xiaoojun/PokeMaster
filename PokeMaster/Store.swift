//
//  Store.swift
//  PokeMaster
//
//  Created by 汤小军 on 2020/3/27.
//  Copyright © 2020 汤小军. All rights reserved.
//

import Combine

class Store: ObservableObject {
     @Published var appState = AppState()
    
    func dispatch(_ action: AppAction) {
        #if DEBUG
        print("[ACTION:\(action)]")
        #endif
        let result = Store.reduce(state: appState, action: action)
        appState = result
    }
    
    static func reduce(state: AppState, action: AppAction) -> AppState {
        var appState = state
        switch action {
        case .login(let email, let password):
            if password == "password" {
                let user = User(email: email, favoritePokemonIDs: [])
                appState.settings.loginUser = user
            }
        }
        return appState
    }
}
 
