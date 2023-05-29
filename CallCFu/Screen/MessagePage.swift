//
//  MessagePage.swift
//  CallCFu
//
//  Created by Ryu on 29/5/2023.
//

import SwiftUI

struct MessagePage: View {
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    VStack {
                        VStack {
                            Text("訊息")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding(10)
                        }
                        .background( Color(red: 1, green: 0.5882030129, blue: 0.0004810865503).ignoresSafeArea(.all) )
                        
                        
                        VStack {
                            Image("cfu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: proxy.size.width * 0.7)
                                .padding(.leading , 15)
                            
                            
                            Text("暫未有訊息紀錄")
                                .font(.body)
                                .padding(.top, 10)
                                .foregroundColor(Color(red: 0.4666665792, green: 0.4666667581, blue: 0.4705880284))
                        }
                        .frame(maxWidth: .infinity , maxHeight: .infinity)
                    }
                    .background(Color(red: 0.9176469445, green: 0.9137256742, blue: 0.9372537136))
                }
            }
        }
    }
}

struct MessagePage_Previews: PreviewProvider {
    static var previews: some View {
        MessagePage()
    }
}
