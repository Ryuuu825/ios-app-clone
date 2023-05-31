//
//  AppEntryView.swift
//  Pocket
//
//  Created by Ryu on 31/5/2023.
//

import SwiftUI



enum Tab : String , View , CaseIterable, Identifiable {
    case Home, Test
    
    var body: some View {
        
        tabContent
            .tabItem {
                tabItem
            }
        
    }
    
    
    var tabItem : some View {
        switch self {
            case .Home : return Label("Home" , systemImage: "house")
            case .Test : return Label("Saves" , systemImage: "house")
        }
    }
    
    
    @ViewBuilder var tabContent : some View {
        switch self {
            case .Home : HomePage()
            case .Test : SavedPage()
        }
    }
    
    
    var id : Self { self }

}

struct AppEntryView: View {
    
    @State private var tab : Tab = .Home
    
    var body: some View {
        TabView(selection: $tab) {
            ForEach(Tab.allCases) { $0 }
        }
    }
}

struct AppEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AppEntryView()
    }
}
