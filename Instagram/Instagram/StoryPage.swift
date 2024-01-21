//
//  StoryPage.swift
//  Instagram
//
//  Created by Ryu on 21/1/2024.
//

import SwiftUI

struct StoryPage: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            GeometryReader { proxy in
                ZStack {
                    Image("posts2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                    
                    HStack {
                        Image(systemName: "mappin")
                        Text("草千里")
                    }
                    .padding(.horizontal,4)
                    .padding(.vertical,2)
                    .background(.black)
                    .cornerRadius(4)
                    .offset(x: 130 , y: 120)
                    
                }
                
            }
            
            VStack(spacing: 12) {
                HStack(spacing:4) {
                    ForEach(0..<4) { i in
                        Rectangle()
                            .frame(width: 370 / 4, height:2)
                            .cornerRadius(.infinity)
                            
                    }
                }
                
                HStack {
                    Image("user1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .cornerRadius(.infinity)
                        .padding(4)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("whiz_cat")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                            
                            Text("3m")
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Image(systemName: "message.fill")
                                .scaleEffect(CGSize(width: -1, height: 1))
                                .font(.system(size: 12))
                                
                            Text("See translation")
                                .fontWeight(.semibold)
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 10))
                                
                        }
                    }
                    .font(.system(size: 14))
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                    Image(systemName: "xmark")
                        .font(.system(size: 28))
                    
                }
                
            }
            .padding(.horizontal,8)
            .offset(y: -360)
            
        }
        .frame(width: 370)
    }
}

struct StoryPage_Previews: PreviewProvider {
    static var previews: some View {
        StoryPage()
    }
}
