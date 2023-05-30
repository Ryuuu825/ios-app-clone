//
//  Option.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI

struct Option: View {
    @State var name : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State var content : String = ""
    
    var body: some View {
        GeometryReader { proxy in
            MyNavigationView(title: "意思／查詢" , isRoot: false) {
               
                VStack {
                    TextField( "稱呼" ,  text: $name )
                        .padding(.leading )
                        .frame(width: .infinity , height: 30)
                        .background(Color(red: 0.9568627477, green: 0.9568627477, blue: 0.9568627477))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    TextField( "電郵地址" ,  text: $name )
                        .padding(.leading )
                        .frame(width: .infinity , height: 30)
                        .background(Color(red: 0.9568627477, green: 0.9568627477, blue: 0.9568627477))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    TextField( "電話號碼" ,  text: $name )
                        .padding(.leading )
                        .frame(width: .infinity , height: 30)
                        .background(Color(red: 0.9568627477, green: 0.9568627477, blue: 0.9568627477))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    TextField( "內容" ,  text: $name )
                        .padding(.leading )
                        .frame(width: .infinity , height: 250)
                        .background(Color(red: 0.9568627477, green: 0.9568627477, blue: 0.9568627477))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                }
                
                Button {} label: {
                    Text("送出")
                        .foregroundColor(.white)
                        .frame(width: proxy.size.width * 0.45 , height: 50)
                        .background(Color(red: 0.2979485989, green: 0.5509883404, blue: 0.305899322))
                        .clipped()
                        .cornerRadius(5)
                }
                .padding(.top , 20 )
                    
                Text("( 歡迎留言查詢，如有需要亦可於辦公時間內致電5131 6906 查詢 )")
                    .foregroundColor(.red)
                    .padding(.top , 10)
                
                
            }
        }
    }
}

struct Option_Previews: PreviewProvider {
    static var previews: some View {
        Option()
    }
}
