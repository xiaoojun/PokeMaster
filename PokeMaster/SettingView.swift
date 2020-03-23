//
//  SettingView.swift
//  PokeMaster
//
//  Created by 汤小军 on 2020/3/23.
//  Copyright © 2020 汤小军. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var settings = Settings()
     var accountSection: some View {
        Section(header: Text("账户")) {
            Picker(selection: $settings.accountBehavior, label: Text("")) {
                ForEach(Settings.AccountBehavior.allCases, id: \.self) {
                    Text($0.text)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            TextField("电子邮箱",text: $settings.email)
            SecureField("密码", text: $settings.password)
            
            if settings.accountBehavior == .register {
                SecureField("确认密码", text: $settings.verifyPassword)
            }
            Button(settings.accountBehavior.text) {
                print("登录注册")
            }
        }
    }
    
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            HStack {
                Text("显示英文名")
                Toggle(isOn: $settings.showEnglishName) {
                     Text("")
                }
            }
            HStack {
                Text("排序方式").foregroundColor(.gray)
                Spacer()
                Button(action: {
                   print("点击了排序方式")
                }) {
                    HStack {
                        Text(self.settings.sorting.text).foregroundColor(.gray)
                        Image(systemName: "chevron.right").foregroundColor(.gray)
                    }
                }
             }
            
            HStack {
                Text("只显示收藏")
                  Toggle(isOn: $settings.showFavoriteOnly) {
                       Text("")
                  }
            }
        }
    }
    
    var actionSection: some View {
        Section {
             Button(action: {
                  
             }) {
                 Text("清空缓存").foregroundColor(.red)
             }
        }
    }
    var body: some View {
        Form {
            accountSection
            optionSection
            actionSection
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}



class Settings: ObservableObject {
    enum AccountBehavior: CaseIterable {
        case register, login
    }
    
    enum Sorting: CaseIterable {
        case id, name, color, favorite
    }
    
    @Published var accountBehavior = AccountBehavior.login
    @Published var email = ""
    @Published var password = ""
    @Published var verifyPassword = ""
    
    @Published var showEnglishName = true
    @Published var sorting = Sorting.id
    @Published var showFavoriteOnly = false
}

extension Settings.Sorting {
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

extension Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register:
            return "注册"
        case .login:
            return "登录"
        }
    }
}
