//
//  SettingView.swift
//  PokeMaster
//
//  Created by 汤小军 on 2020/3/23.
//  Copyright © 2020 汤小军. All rights reserved.
//

import SwiftUI

struct SettingView: View {
     @EnvironmentObject var store: Store
    
    var settingsBinding: Binding<AppState.Settings> {
        $store.appState.settings
    }
    
    var settings: AppState.Settings {
        store.appState.settings
    }
      var accountSection: some View {
         Section(header: Text("账户")) {
            if settings.loginUser == nil {
                Picker(selection: settingsBinding.accountBehavior, label: Text("")) {
                    ForEach(AppState.Settings.AccountBehavior.allCases, id: \.self) {
                        Text($0.text)
                    }
                }.pickerStyle(SegmentedPickerStyle())

                TextField("电子邮箱",text: settingsBinding.email)
                SecureField("密码", text: settingsBinding.password)

                if settings.accountBehavior == .register {
                    SecureField("确认密码", text: settingsBinding.verifyPassword)
                }
                
                Button(settings.accountBehavior.text) {
                    self.store.dispatch(.login(email: self.settings.email, password: self.settings.password))
                }

            } else {
                Text(settings.loginUser!.email)
                Button("注销"){
                    
                }
            }

        }
    }
    
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: settingsBinding.showEnglishName) {
                 Text("显示英文名")
            }
            Picker(selection: settingsBinding.sorting, label: Text("排序方式")) {
                ForEach(AppState.Settings.Sorting.allCases,id: \.self) {
                    Text($0.text)
                }
            }
            
            Toggle(isOn: settingsBinding.showFavoriteOnly) {
                 Text("只显示收藏")
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
        let store = Store()
        store.appState.settings.sorting = .color
        return SettingView().environmentObject(store)
    }
}



struct User: Codable {
    var email: String
    var favoritePokemonIDs: Set<Int>
    func isFavoritePokemon(id: Int) -> Bool {
        favoritePokemonIDs.contains(id)
    }
    
}
