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

struct SpotifyAppView: View {
    @State private var tab: Tab = .Home
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            tab
            
            HStack {
                Image("yuika-suki")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40 , height: 40)
                    .background(Color.white)
                    .cornerRadius(4)
                
                VStack {
                    Text("好きたから。")
                        .fontWeight(.medium)
                    
                    Text("「ユイカ」")
                }
                .font(.caption)
                
                Spacer()
                
                
                HStack(spacing: 20) {
                    Image(systemName: "tv.and.hifispeaker.fill")
                    
                    Image(systemName: "play.fill")
                    
                }
                .font(.headline)
                .padding(.trailing , 12)
                
                    
            }
            .padding(6)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.1097778752, green: 0.2000038028, blue: 0.2392120361))
            .cornerRadius(8)
            .padding(.horizontal)
            
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
