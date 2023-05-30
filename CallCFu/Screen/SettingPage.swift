//
//  SettingPage.swift
//  CallCFu
//
//  Created by Ryu on 29/5/2023.
//

import SwiftUI

fileprivate enum SystemLanguage: String , CaseIterable , Identifiable {
    case Chinese = "中文" , English = "Eng"
    
    var id : Self { self }

}

struct SettingPage: View {
    
    @State fileprivate var systemLanguage : SystemLanguage = .Chinese
    
    var body: some View {
        
        MyNavigationView(title: "設定和其他") {
            Form {
                Section("語言") {
                    Picker("sdf" , selection: $systemLanguage ) {
                        ForEach(SystemLanguage.allCases) { Text($0.rawValue) }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("推播通知") {
                    Toggle(isOn: .constant(true)) {
                        Text("柯打推播")
                    }
                    
                    Toggle(isOn: .constant(true)) {
                        Text("訊息推播")
                    }
                }
                
                
                Section("資訊") {
                    NavigationLink(destination: LatestInfo() ) {
                        "最新通知"
                    }
                    
                    NavigationLink(destination: FAQ() ) {
                        Text("常見問題")
                    }
                    
                    NavigationLink(destination: PrivacyPolicy() ) {
                        Text("私隱政策")
                    }
                    
                    NavigationLink(destination: Aboutus() ) {
                        "關於我們"
                    }
                }
                
                
                Section("其他") {
                    NavigationLink(destination: PastRecords() ) {
                        Text("連結過往柯打及對話記錄")
                    }
                    
                    NavigationLink(destination: Option() ) {
                        Text("意見及查詢")
                    }
                    
                    Link(destination: URL(string: "https://github.com/Ryuuu825/ios-app-clone")! , label: {
                        HStack {
                            Text("給倜好評吧")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }).foregroundColor(.label)
                    
                    Link(destination: URL(string: "https://github.com/Ryuuu825/ios-app-clone")! , label: {
                        HStack {
                            Text("給Call 師傅打賞支持")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }).foregroundColor(.label)
                    
                    
                    Link(destination: URL(string: "https://github.com/Ryuuu825/ios-app-clone")! , label: {
                        HStack {
                            Text("下載 \"Call師傳 - 師傳版\"")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }).foregroundColor(.label)
                    
                }
                
                
                
            }
        }
        
    }
}

struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
            .background(Color(red: 0.9176469445, green: 0.9137256742, blue: 0.9372537136))
        
    }
}
