//
//  One.swift
//  DesignCode
//
//  Created by Ryu on 9/6/2023.
//

import SwiftUI

extension View {
    func blurBackground(_ colors : [Color] = [Color(red: 0.5, green: 0.5, blue: 0.5)]) -> some View {
        return background {
            background {
                Color.black.opacity(0.2)
            }
            .background( .thinMaterial )
        }
    }
    
    func clipedCornerRadius( _ radius : CGFloat ) -> some View {
        clipped()
        .cornerRadius(radius)
    }
}

struct One : View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()) , count: 2)) {
                    ForEach(1..<12) { _ in
                        card()
                    }
                }
                
            }
            .padding()
            .navigationTitle("Explore")
            
        }
    }
    
    func card(
        title : String = "Human Interface Guidelines",
        description : String = "The HIG contains guidance and best practices that can help you design a great experience for any Apple platform."
    ) -> some View {
        let height : CGFloat = 280
        
        return ZStack {
            
            Image("ayanami")
                .resizable()
                .scaledToFit()
                .scaleEffect(1.5)
                .frame( height: height )
                
            VStack(alignment: .center , spacing: 4) {
                
                Text(title)
                    .font(.title3)
                    .bold()
                
                Text(description)
                    .font(.subheadline)
                    .lineLimit(2)
                    
                
            }
            .padding(.horizontal)
            .padding(.bottom , 12)
            .frame(maxWidth: .infinity , maxHeight: 120 , alignment: .leading)
            .background {
                Color.black.opacity(0.2)
            }
            .background( .thinMaterial )
            .padding(.top , 160)

        }
        .clipedCornerRadius(20)
        .foregroundColor(.white)
        .frame(height: height)
        .padding(.vertical, 12)
        .padding(.horizontal, 4)
    }
    
    
    
}


struct One_Previews: PreviewProvider {
    static var previews: some View {
        One()
    }
}
