//
//  AppState.swift
//  PokeMaster
//
//  Created by 汤小军 on 2020/3/27.
//  Copyright © 2020 汤小军. All rights reserved.
//

import SwiftUI

struct AppState {
    var settings = Settings()
}

 
extension AppState {
    struct Settings {
        var loginUser: User?
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }
        var showEnglishName = false
        var sorting = Sorting.id
        var showFavoriteOnly = false
        
        
        enum AccountBehavior: CaseIterable {
            case register, login
        }
        var accountBehavior = AccountBehavior.register
        var email = ""
        var password = ""
        var verifyPassword = ""
    }
}

extension AppState.Settings.Sorting {
    var text: String {
        switch self {
        case .id:
            return "ID"
        case .name:
            return "名字"
        case .color:
            return "颜色"
        case .favorite:
            return "最爱"
        }
    }
}

extension AppState.Settings.AccountBehavior {
    var text: String {
        switch self {
        case .login:
            return "登录"
        case .register:
            return "注册"
        }
    }
}

 
