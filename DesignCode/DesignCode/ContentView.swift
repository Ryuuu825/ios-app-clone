//
//  ContentView.swift
//  DesignCode
//
//  Created by Ryu on 8/6/2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            One()
                .tabItem {
                    Label("One", image: "")
                }
            
            Two()
                .tabItem {
                    Label("Two", image: "")
                }
            
            Three()
                .tabItem {
                    Label("Three", image: "")
                }
            
            Four()
                .tabItem {
                    Label("Four", image: "")
                }
            
            Five()
                .tabItem {
                    Label("Five", image: "")
                }
            
            Sheet()
                .tabItem {
                    Label("Sheet", image: "")
                }
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
