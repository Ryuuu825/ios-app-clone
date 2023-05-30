//
//  LatestInfo.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI

struct LatestInfo: View {
    
    @State var news : [ (String , String ) ] = [
        ("Call C Fu 5.0 version update" , "2021-01-12"),
        ("new version 4.0 update" , "2019-01-05"),
        ("If you joined, C Fu quality will be better" , "201-01-20"),
        ("Call C Fu introduction" , "2015-07-29")
    ]
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
    }
 
    var body: some View {
        MyNavigationView(title: "最新通知" , isRoot: false) {
        
        
                
            ForEach(news , id:\.0 ) { new in
                
                VStack ( spacing: 12 ) {
                    Text(new.0)
                        .font(.system(size: 20))
                        .fontWeight(.regular)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        
                        
                    
                    Text(new.1)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity , alignment: .trailing)
                    
                        
                }.padding(.horizontal , 10)
                
                Divider()
                
            }
            

        }
      
        
    }
}

struct LatestInfo_Previews: PreviewProvider {
    static var previews: some View {
        LatestInfo()
    }
}
