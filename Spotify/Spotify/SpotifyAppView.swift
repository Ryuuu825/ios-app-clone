//
//  SpotifyAppView.swift
//  Spotify
//
//  Created by Ryu on 31/5/2023.
//

import SwiftUI

enum Tab : String , View , CaseIterable {
    case Home
    
    var body : some View {
        switch self {
            case .Home : return HomePage()
        }
    }
        
    @ViewBuilder var tabItem : some View {
        switch self {
            case .Home : VStack { Image(systemName: "house.fill"); Text("ホーム").font(.footnote) }
        }
    }
}



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

struct SpotifyAppView: View {
    
    let lyris =
"""
We are no strangers to love
You know the rules and so do I
A full commitment′s what I am thinking of
You wouldn′t get this from any other guy
I just want to tell you how I am feeling
Gotta make you understand
Never gonna give you up never gonna let you down
Never gonna run around and desert you
    
"""
   
    
    @State private var tab: Tab = .Home
    @State private var shouldShowPlayMusicPage = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            tab
            
            PlayBar()
                .onTapGesture {
                    shouldShowPlayMusicPage.toggle()
                }
            
            HStack {
                ForEach(Tab.allCases, id:\.rawValue) { t in
                    Button {
                        tab = t
                    } label: {
                        t.tabItem
                    }
                    .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top , 12)
        }
        .preferredColorScheme(.dark)
        .fullScreenCover(isPresented: $shouldShowPlayMusicPage , content: {
            GeometryReader { proxy in
                VStack {
                   
                    ScrollView(showsIndicators: false) {
                        HStack {
                            
                            Image(systemName: "chevron.down")
                                .onTapGesture {
                                    shouldShowPlayMusicPage = false
                                }
                            
                            Spacer()
                            
                            Text("お気に入りの曲")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Spacer()
                            
                            Image(systemName: "ellipsis")
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal , 24)
                        .font(.headline)
                        .padding(.top , 12)
                        
                        Image("giveup-rect")
                            .resizable()
                            .frame(maxWidth: proxy.size.width  , maxHeight: proxy.size.width * 0.87 )
                            .clipped()
                            .padding(.top , 80)
                            .padding(.horizontal , 24)
                        
                        
                        VStack {
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Never Gonna Give You Up")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    
                                    Text("Rick Astley")
                                        .fontWeight(.regular)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "plus.circle")
                                    .font(.title2)
                                
                            }
                            
                            VStack(spacing: 0) {
                                Slider(value: .constant( 0.92 ) , in: 0...1, step: 1)
                                     .accentColor(.white)
                                     
                                     .onAppear {
                                         let progressCircleConfig = UIImage.SymbolConfiguration(scale: .small)
                                         UISlider.appearance()
                                             .setThumbImage(UIImage(systemName: "circle.fill",
                                                                    withConfiguration: progressCircleConfig), for: .normal)
                                     }
                                
                                HStack {
                                    
                                    Text("3:21")
                                    
                                    Spacer()
                                    
                                    Text("0:11")
                                }
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .padding(.top , -4 )
                                
                            }.padding(.vertical , 20)
                                     
                                    
                            
                            
                            HStack(spacing: 38 ) {
                                
                                Image(systemName: "shuffle")
                                    .font(.system(size: 24))
                                
                                Image(systemName: "backward.end.fill")
                                    .font(.system(size: 32))
                                    
                                
                                Image(systemName: "arrowtriangle.right.circle.fill")
                                    .font(.system(size: 64))
                                    
                                
                                Image(systemName: "forward.end.fill")
                                    .font(.system(size: 32))
                                
                                Image(systemName: "repeat.1")
                                    .font(.system(size: 24))
                                    .foregroundColor(.green)
                            
                            }
                            .fontWeight(.thin)
                            
                            
                            
                            HStack(spacing: 32) {
                                
                                Image(systemName: "hifispeaker.2")
                                
                                Spacer()
                                
                                Image(systemName: "square.and.arrow.up")
                                
                                Image(systemName: "line.3.horizontal")
                                
                            }
                            .fontWeight(.medium)
                            .padding(.top , 32)
                            .padding(.horizontal , 12)
                            
  
                        }
                        .padding(.top , 32)
                        .frame(width:.infinity)
                        .padding(.horizontal, 32)
                        
                        VStack {
                            HStack {
                                Text("歌詞")
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                                Image(systemName: "square.and.arrow.up")
                                    .padding(6)
                                    .background(Color(UIColor.black).opacity(0.4))
                                    .cornerRadius(.infinity)
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .padding(6)
                                    .background(Color(UIColor.black).opacity(0.4))
                                    .cornerRadius(.infinity)
                                
                            }
                            
                            Text(lyris)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.title2)
                                .padding(3)
                                .padding(.top , 12)
                       
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity , maxHeight: 300)
                        .background(Color(red: 0.03260218889, green: 0.3519735694, blue: 0.6274399161))
                        .cornerRadius(6)
                        .padding(.top , 12)
                        .padding(.horizontal, 24)
                        
                    }
                   
                }
                .frame(maxWidth: .infinity , maxHeight: UIScreen.main.bounds.height)
                .presentationDetents([.height(1000)])
                .background(
                    LinearGradient(colors: [Color(red: 0.05467618257, green: 0.3647152185, blue: 0.458815217) , Color(red: 0.01055992915, green: 0.0729453993, blue: 0.1143102872)], startPoint: .top, endPoint: .bottom)
                )
                .foregroundColor(.white)
                .preferredColorScheme(.dark)
            }
        })
        
        
    }
}

struct SpotifyAppView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyAppView()
            .environment(\.colorScheme, .dark)
    }
}
