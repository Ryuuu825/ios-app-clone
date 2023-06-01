//
//  MiniPlayBar.swift
//  Spotify
//
//  Created by Ryu on 1/6/2023.
//

import SwiftUI

extension View {
   
    @ViewBuilder func TimeBar() -> some View {
        
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity )
                .foregroundColor( Color.gray)
            
            GeometryReader { proxy in
                HStack {
                    Rectangle()
                        .frame(maxWidth: proxy.size.width * 0.3)
                }
            }
                
        }
        .frame(maxWidth:.infinity , maxHeight: 3 )
    }
    
    @ViewBuilder func PlayBar() -> some View {
        VStack(spacing: 4) {
            HStack {
                Image("giveup-rect")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40 , height: 40)
                    .background(Color.white)
                    .cornerRadius(4)
                
                VStack {
                    Text("Never Gonna Give You Up")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity , alignment: .leading)


                    Text("Rick Astley")
                        .frame(maxWidth: .infinity , alignment: .leading)
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                .font(.caption)
                
                Spacer()
                
                
                HStack(spacing: 20) {
                    Image(systemName: "tv.and.hifispeaker.fill")
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    
                    Image(systemName: "play.fill")
                    
                }
                .font(.headline)
                .padding(.trailing , 12)
                
            }
             
            
            TimeBar()

        }
        .padding(6)
        .padding(.bottom , -6)
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.01055992915, green: 0.0729453993, blue: 0.1143102872))
        .cornerRadius(8)
        .padding(.horizontal)
        
    }
}
