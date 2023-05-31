//
//  AppEntry.swift
//  CallCFu
//
//  Created by Ryu on 29/5/2023.
//

import SwiftUI

enum Tab : String, View , CaseIterable , Identifiable {
    case Home, Order, Message, MyCFu, Setting
}

extension Tab {
    @ViewBuilder
    private var content: some View {
        switch self {
            case .Home : HomePage()
            case .Order: OrderRecordsPage()
            case .Message: MessagePage()
            case .MyCFu: MyCFuPage()
            case .Setting: SettingPage()
        }
    }
    
    private var tabLabel: some View {
        switch self {
            case .Home:
                return Label("", image: "tab1")
            case .Order:
                return Label("", image: "tab2")
            case .Message:
                return Label("", image: "tab3")
            case .MyCFu:
                return Label("", image: "tab4")
            case .Setting:
                return Label("", image: "tab5")
           
        }
    }
    
    var body : some View {
        
        content
            .tabItem {
                tabLabel
            }
            .background(Color.white)
    }
}

extension Tab {
    var id : Self { self }
}

struct AppEntry: View {
    
    @State var tab : Tab = .Home
    
    var body: some View {
        NavigationStack {
            TabView(selection: $tab ) {
                ForEach(Tab.allCases) { $0 }
            }
        }
    }
}

struct AppEntry_Previews: PreviewProvider {
    static var previews: some View {
        AppEntry()
    }
}
