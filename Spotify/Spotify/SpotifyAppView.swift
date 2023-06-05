//
//  SpotifyAppView.swift
//  Spotify
//
//  Created by Ryu on 31/5/2023.
//

import SwiftUI

enum Tab : String , View , CaseIterable {
    case Home, Search , Mylibrary
    
    @ViewBuilder var body : some View {
        switch self {
            case .Home :  HomePage()
            case .Mylibrary :  MyLibrary()
            case .Search :  SearchPage()
        }
    }
        
    @ViewBuilder var tabItem : some View {
        switch self {
            case .Home : VStack { Image(systemName: "house").font(.title3); Text("ホーム").font(.footnote).padding(.top, 2 ) }
            case .Search : VStack { Image(systemName: "magnifyingglass").font(.title3); Text("マイライブラリ").font(.footnote).padding(.top, 2 ) }
            case .Mylibrary : VStack { Image(systemName: "books.vertical").font(.title3); Text("マイライブラリ").font(.footnote).padding(.top, 2 ) }
        }
    }
    
    
    @ViewBuilder var ftabItem : some View {
        switch self {
            case .Home : VStack { Image(systemName: "house.fill").font(.title3); Text("ホーム").font(.footnote).padding(.top, 2 ) }
        case .Search : VStack { Image(systemName: "magnifyingglass.circle.fill").font(.title3); Text("マイライブラリ").font(.footnote).padding(.top, 2 ) }
            case .Mylibrary : VStack { Image(systemName: "books.vertical.fill").font(.title3); Text("マイライブラリ").font(.footnote).padding(.top, 2 ) }
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
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3 )) {
                ForEach(Tab.allCases, id:\.rawValue) { t in
                    Button { tab = t; } label: {
                        if tab == t {
                            t.ftabItem
                        } else {
                            t.tabItem
                        }
                    }
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
