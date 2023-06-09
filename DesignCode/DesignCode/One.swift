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
            LinearGradient(colors: colors , startPoint: .top, endPoint: .bottom)
                .opacity(0.9)
                .blur(radius: 24, opaque: true)
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
                        ZStack {
                            
                            Image("ayanami")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(1.5)
                                .frame( height: 280 )
                                
                            VStack(spacing: 4) {
                                
                                Text("Human Interface Guidelines")
                                    .font(.title3)
                                    .bold()
                                    
                                
                                Text("The HIG contains guidance and best practices that can help you design a great experience for any Apple platform.")
                                    .font(.callout)
                                    .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                                    .lineLimit(2)
                                
                            }
                            .padding(.horizontal)
                            .padding(.vertical , 12)
                            .frame(maxWidth: .infinity , maxHeight: 120 , alignment: .leading)
                            .blurBackground()
                            .padding(.top , 160)

                        }
                        .clipedCornerRadius(20)
                        .foregroundColor(.white)
                        .frame(height: 280)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 4)
                    }
                }
                .padding()
                .navigationTitle("Explore")
                
                Spacer()
            }
            
        }
    }
    
    
    
}


struct One_Previews: PreviewProvider {
    static var previews: some View {
        One()
    }
}
