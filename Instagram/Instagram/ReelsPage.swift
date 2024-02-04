//
//  ReelsPage.swift
//  Instagram
//
//  Created by Ryu on 4/2/2024.
//

import SwiftUI
import AVKit


struct ReelsPage: View {
    let player =  AVPlayer(url: Bundle.main.url(forResource: "1", withExtension: "mp4")!)
    
    @State var timeLeft : Double = 50
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            VideoPlayer(player: player)
                .onAppear {
                    player.currentItem?.preferredForwardBufferDuration = TimeInterval(1)
                    player.play()
                }
            
            HStack {
                HStack {
                    Text("Reels")
                        .font(.system(size: 22))
                        .bold()
                    Image(systemName: "chevron.down")
                }
                
                Spacer()
                
                Image(systemName: "camera")
            }
            .padding(.horizontal)
            .offset(y: -350)
            
            VStack {
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading , spacing: 4) {
                        HStack {
                            UserIcon("http://127.0.0.1:9999/user1.png", "user", width: 25, noRing: true)
                            
                            Text("Ryu_sumo")
                                .fontWeight(.semibold)
                            
                            Text("Follow")
                                .font(.system(size: 10))
                                .fontWeight(.semibold)
                                .padding(4)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.white, lineWidth: 0.5)
                                }
                        }
                        
                        Text("🥵🥵🥵...")
                        
                    }
                    
                    .font(.system(size: 15))
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 24) {
                        VStack(spacing: 8) {
                            Image(systemName: "heart")
                            Text("Likes")
                                .font(.system(size: 14))
                        }
                        
                        VStack(spacing: 8) {
                            Image(systemName: "message")
                            Text("4154")
                                .font(.system(size: 14))
                        }
                        
                        VStack(spacing: 8) {
                            Image(systemName: "paperplane")
                                .resizable()
                                .frame(width: 19, height: 22)
                                .rotationEffect(.degrees(20))
                                .offset(y:-2)
                            
                            Text("303k")
                                .font(.system(size: 14))
                        }
                        
                        Image(systemName: "ellipsis")
                            .font(.system(size: 16))
                    }
                    .font(.system(size: 24))
                }
                
                //Color.clear.frame(height: 50)
                
                GeometryReader { proxy in
                    
                    let w = ( Double(proxy.size.width) / Double(50) ) * (50 - timeLeft)
                    
                    Rectangle()
                        .frame(width: CGFloat(w), height: 1)
                        .animation(.spring(), value: timeLeft)
                }
                .frame(height: 1)
                //.offset(y:-10)
                .onReceive(timer) { _ in
                    if timeLeft > 0 {
                        timeLeft -= 1
                    }
                }
                
                
            }
            .padding(.horizontal, 12)
            //.ignoresSafeArea()
            .frame(maxHeight: .infinity)
            
            
                
        }
        .preferredColorScheme(.dark)
    }
}

struct ReelsPage_Previews: PreviewProvider {
    static var previews: some View {
        ReelsPage()
    }
}
