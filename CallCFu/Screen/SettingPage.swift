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
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    VStack {
                        Text("設定及其他")
                            .font(.title3)
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(10)
                    }
                    .background( Color(red: 1, green: 0.5882030129, blue: 0.0004810865503).ignoresSafeArea(.all) )
                    
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
                            NavigationLink(destination: Text("sdf")) {
                                Text("最新通知")
                            }
                            
                            NavigationLink(destination: Text("sdf")) {
                                Text("常見問題")
                            }
                            
                            NavigationLink(destination: Text("sdf")) {
                                Text("私隱政策")
                            }
                            
                            NavigationLink(destination: Text("sdf")) {
                                "關於我們"
                            }
                        }
                        
                        
                        Section("其他") {
                            NavigationLink(destination: "sdf" ) {
                                Text("連結過往柯打及對話記錄")
                            }
                            
                            NavigationLink(destination: Text("sdf")) {
                                Text("意見及查詢")
                            }
                            
                            NavigationLink(destination: Text("sdf")) {
                                Text("給倜好評吧")
                            }
                            
                            NavigationLink(destination: Text("sdf")) {
                                Text("給Call 師傅打賞支持")
                            }
                            
                            NavigationLink(destination: Text("sdf")) {
                                Text("下載 \"Call師傳 - 師傳版\"")
                            }
                        }
                        
                        
                        
                    }
                    
                }
                .background(Color(red: 0.9176469445, green: 0.9137256742, blue: 0.9372537136))
            }
        }
    }
}

struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
            
        
    }
}
