//
//  ClubhouseAppEntryView.swift
//  Clubhouse
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI

enum Tab : String, View, CaseIterable {
    
    case Home, Explore, House
    
    
    @ViewBuilder var body : some View {
        content
            .tabItem {
                tabItem
            }
    }
    
    
    @ViewBuilder var content : some View {
        switch self {
            case .Home: HomePageView()
            case .Explore: ExplorePageView()
            case .House: HousePageView()
        }
    }
    
    
    @ViewBuilder var tabItem : some View {
        switch self {
        case .Home: Label("Home", systemImage: "house")
            case .Explore: Label("Explore", systemImage: "magnifyingglass")
            case .House: Label("House", systemImage: "house.lodge")
        }
        
    }
    
    
    
}

struct ClubhouseAppEntryView: View {
    
    @State var tab : Tab = .Home
    
    var body: some View {
       
        
        
        TabView(selection: $tab) {
            ForEach(Tab.allCases, id: \.hashValue) { $0 }
                
        }
        .preferredColorScheme(.dark)
        .background()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClubhouseAppEntryView()
    }
}
