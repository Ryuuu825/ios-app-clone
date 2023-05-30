//
//  SelectedMainService.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI

struct SelectedMainService: View {
    
    @State private var category : [(String , String)] = [
        ("家務雜務", "預備膳食、園藝修剪、家居執拾或清潔等服務"),
        ("滅蟲滅鼠", "殺滅各類害蟲、螞蟻、老鼠及相關服務"),
        ("清洗冷氣", "清洗各式冷氣、隔塵網及相關服務"),
        ("專業清潔", "家居、餐廳清潔消毒等需要專業工具或器材的一次性淸潔服務"),
        ("裝修後清潔", "裝修或工程後清潔、吉屋清潔等相關服務"),
        ("地板打蠟", "地板打蠟及相關服務"),
        ("地毯清潔", "地毯清潔及相關服務"),
        ("殺菌消毒", "提供專業醫療級別消毒服務，包括霧化、噴霧、焗霧及塗層等相關消毒服務。")
    ]
    var body: some View {
        MyNavigationView(title: "服務類別" , isRoot: false , bgColor: .secondarySystemBackground ) {
            ScrollView {
                ForEach(category, id: \.0 ) { cat in
                    VStack {
                        Text(cat.0)
                            .foregroundColor(.orange)
                            .padding(6)
                            .border(Color.orange)
                            .frame(maxWidth: .infinity , alignment: .leading)
                        
                        Text(cat.1)
                            .frame(maxWidth: .infinity , alignment: .leading)
  
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .background(Color.white)
                    .padding(.horizontal , 12 )
                    
                }
            }
        }
    }
}

struct SelectedMainService_Previews: PreviewProvider {
    static var previews: some View {
        SelectedMainService()
    }
}
