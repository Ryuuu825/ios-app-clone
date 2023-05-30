//
//  NavigationView.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI

struct MyNavigationView<Content: View>: View {
    
    var title : String
    @ViewBuilder var content : Content
    var isRoot : Bool
    var bgColor : Color
    
    init(title: String, isRoot : Bool = true , bgColor : Color = .white , @ViewBuilder content: @escaping () -> Content ) {
        self.title = title
        self.content = content()
        self.bgColor = bgColor
        self.isRoot = isRoot
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom , 15 )
                    .frame(maxWidth: .infinity, minHeight: 20 )
                    .background( Color(red: 1, green: 0.5882030129, blue: 0.0004810865503).ignoresSafeArea(edges: [.top]) )
                    .offset(y : isRoot ? 0 : -35 )
            
                content
            
                Spacer()
            }
            .background(bgColor)
            
        }
        .navigationTitle( isRoot ? title : "" )
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView(title: "sdfskdjf") {
            Text("ksudf")
        }
    }
}
