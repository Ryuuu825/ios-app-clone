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
            case .Home : VStack { Image(systemName: "house.fill"); Text("ホーム").font(.footnote).padding(.top, 2 ) }
        }
    }
}





struct SpotifyAppView: View {
    

    
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
                    Button { tab = t; } label: { t.tabItem }
                }
            }
            .padding(.horizontal)
            .padding(.top , 12)
        }
        .foregroundColor(.white)
        .preferredColorScheme(.dark)
        .fullScreenCover(isPresented: $shouldShowPlayMusicPage , content: {
            Popup_ActivePlay()
        })
    }
}

struct SpotifyAppView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyAppView()
            .environment(\.colorScheme, .dark)
    }
}
