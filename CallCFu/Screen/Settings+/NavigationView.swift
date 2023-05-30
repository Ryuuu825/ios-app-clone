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
            
            VStack ( spacing: 0 ) {
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom , 15 )
                    .padding(.top , isRoot ? 10 : 0 )
                    .frame(maxWidth: .infinity, minHeight: 20 )
                    .background( Color(red: 1, green: 0.5882030129, blue: 0.0004810865503).ignoresSafeArea(edges: [.top]) )
                    .offset(y : isRoot ? 0 : -35 )
            
                content
                    .offset(y : isRoot ? 0 : -15 )
                    .padding(.top , isRoot ? 15 : 0 )
                    .background(bgColor)
                    
                
            
                Spacer()
            }
            
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(isRoot ? Color.white : bgColor)
     
        }
        .background(Color.white)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView(title: "sdfskdjf") {
            VStack {
                Color.gray
            }
        }
    }
}
