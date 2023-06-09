//
//  Five.swift
//  DesignCode
//
//  Created by Ryu on 9/6/2023.
//

import SwiftUI

struct Five: View {
    var body: some View {
        NavigationView {
            VStack  {
                ScrollView {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach (1..<6) { _ in
                                ZStack {
                                    
                                    Image("ayanami")
                                        .resizable()
                                        .frame( height: 380 )
                                        
                                    VStack(spacing: 4) {
                                        
                                        Text("Human Interface Guidelines")
                                            .font(.title3)
                                            .bold()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("The HIG contains guidance and best practices that can help you design a great experience for any Apple platform.")
                                            .font(.callout)
                                            .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                                            .lineLimit(2)
                                        
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical , 12)
                                    .frame(maxWidth: .infinity , maxHeight: 120 , alignment: .leading)
                                    .blurBackground()
                                    .padding(.top , 250)

                                }
                                .foregroundColor(.white)
                                .frame(width: 250 , height: 380)
                                .clipedCornerRadius(20)
                                .padding(.horizontal, 4)
                            }
                        }
                    }
                    
                    VStack {
                        Text("Recent recipes")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity , alignment: .leading)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()) , count: 1)) {
                            ForEach(1..<5) { _ in
                                HStack {
                                    
                                    Image("ayanami")
                                        .resizable()
                                        .frame(width: 90, height: 90)
                                        .clipedCornerRadius(20)
                                        
                                    VStack(spacing: 8) {
                                        
                                        Text("Human Interface Guidelines")
                                            .font(.headline)
                                            .bold()
                                            .frame(maxWidth: .infinity , alignment: .leading)
                                        
                                        Text("The HIG contains guidance and best practices that can help you design a great experience for any Apple platform.")
                                            .font(.subheadline)
                                            .lineLimit(3)
                                            .foregroundColor(Color(UIColor.secondaryLabel))
                                            .frame(maxWidth: .infinity , alignment: .leading)
                                    }
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .padding(.leading , 12)
                                   
                                }
                                .foregroundColor(Color(UIColor.label))
                                .padding(.vertical, 12)
                                .padding(.horizontal, 4)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .padding()
            }
            .navigationTitle("Explore")
        }
    }
}

struct Five_Previews: PreviewProvider {
    static var previews: some View {
        Five()
    }
}
