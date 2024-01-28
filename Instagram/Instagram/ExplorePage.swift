//
//  ExplorePage.swift
//  Instagram
//
//  Created by Ryu on 28/1/2024.
//

import SwiftUI
import AVKit

struct ExplorePage: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Search")
                Spacer()
            }
            .padding(.leading, 12)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(12)
            .padding(.horizontal, 8)
            
            GeometryReader {proxy in
                ScrollView(.vertical) {
                    VStack(spacing: 2) {
                    
                        ForEach(1..<6 , id:\.hashValue) { _ in
                            HStack(spacing: 2) {
                             
                                LazyVGrid(columns: Array(repeating: GridItem(spacing:2), count: 2), spacing: 2) {
                            
                                    ForEach ( 1..<5 , id:\.hashValue) { _ in
                                        ZStack {
                                            Image([ "myposts1" , "myposts2" , "posts1" , "posts2" , "story1" , "highlight1"].randomElement()!)
                                                .resizable()
                                                .scaledToFill()
                                                .cornerRadius(0)
                                            
                                                
                                            ZStack {
                                                
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(.white , lineWidth: 1.5)
                                                    .frame(width: 15 , height: 15)
                                                
                                                
                                                Rectangle()
                                                    .frame(width: 15 , height: 15)
                                                    .cornerRadius(4)
                                                    .offset(x: -3 , y: -3)
                                                
                                            }
                                            .offset(x: 45, y: -45)
                                        }
                                        .frame(width: proxy.size.width / 3  , height: proxy.size.width / 3 )
                                        .cornerRadius(0)
                                        
                                    }
                                }
                                .frame(width: proxy.size.width / 3 * 2 , height: proxy.size.width / 3 * 2)
                                
                                @State var player = AVPlayer(url: Bundle.main.url(forResource: "a", withExtension: "mp4")!)
                                VideoPlayer(player: player)
                                    .frame(width: proxy.size.width / 3, height: proxy.size.width / 3 * 2 )
                                    .cornerRadius(0)
                                    .onAppear {
                                        player.play()
                                    }

                            }
                            .frame(maxWidth: .infinity)
                            
                            HStack(spacing: 2) {
                             
                                @State var player = AVPlayer(url: Bundle.main.url(forResource: "a", withExtension: "mp4")!)
                                VideoPlayer(player: player)
                                    .frame(width: proxy.size.width / 3, height: proxy.size.width / 3 * 2 )
                                    .cornerRadius(0)
                                    .onAppear {
                                        player.play()
                                    }
                                
                                LazyVGrid(columns: Array(repeating: GridItem(spacing:2), count: 2), spacing: 2) {
                            
                                    ForEach ( 1..<5 , id:\.hashValue) { _ in
                                        ZStack {
                                            Image(["myposts1" , "myposts2" , "posts1" , "posts2" , "story1" , "highlight1"].randomElement()!)
                                                .resizable()
                                                .scaledToFill()
                                                .cornerRadius(0)
                                            
                                                
                                            ZStack {
                                                
                                                RoundedRectangle(cornerRadius: 4)
                                                    .stroke(.white , lineWidth: 1.5)
                                                    .frame(width: 15 , height: 15)
                                                
                                                
                                                Rectangle()
                                                    .frame(width: 15 , height: 15)
                                                    .cornerRadius(4)
                                                    .offset(x: -3 , y: -3)
                                                
                                            }
                                            .offset(x: 45, y: -45)
                                        }
                                        .frame(width: proxy.size.width / 3  , height: proxy.size.width / 3 )
                                        .cornerRadius(0)
                                        
                                    }
                                }
                                .frame(width: proxy.size.width / 3 * 2 , height: proxy.size.width / 3 * 2)
                                
                                

                            }
                            .frame(maxWidth: .infinity)
                        }

                        
                    }
                    
                    
                    
                }
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePage()
    }
}
