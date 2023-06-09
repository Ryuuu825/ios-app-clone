//
//  Three.swift
//  DesignCode
//
//  Created by Ryu on 9/6/2023.
//

import SwiftUI

struct Three: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()) , count: 1)) {
                    ForEach(1..<5) { _ in
                        rowCtx
                    }
                }
                .padding()
                .navigationTitle("Explore")
                
                Spacer()
            }
            
        }
    }
    
    var rowCtx : some View {
        HStack {
            
            Image("ayanami")
                .resizable()
                .frame(width: 100, height: 100)
                .clipedCornerRadius(20)
                
            VStack(spacing: 8) {
                
                Text("Human Interface Guidelines")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity , alignment: .leading)
                
                Text("The HIG contains guidance and best practices that can help you design a great experience for any Apple platform.")
                    .font(.callout)
                    .lineLimit(3)
                
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding(.leading , 12)
           
        }
        .foregroundColor(Color(UIColor.label))
        .padding(.vertical, 12)
        .padding(.horizontal, 4)
    }
}

struct Three_Previews: PreviewProvider {
    static var previews: some View {
        Three()
    }
}
