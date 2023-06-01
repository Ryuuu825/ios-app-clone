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
                .foregroundColor(Color.gray)
            
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
    @State private var tab: Tab = .Home
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            tab
            
            PlayBar()
            
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
        
    }
}

struct SpotifyAppView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyAppView()
            .environment(\.colorScheme, .dark)
    }
}
