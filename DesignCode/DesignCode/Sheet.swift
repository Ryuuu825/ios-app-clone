//
//  Sheet.swift
//  DesignCode
//
//  Created by Ryu on 9/6/2023.
//

import SwiftUI

struct Sheet: View {
    var body: some View {
        
        NavigationStack {
            VStack {
                GeometryReader { proxy in
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            VStack {
                                Text("My beautiful \nrecipe")
                                    .font(.system(size: 36))
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                
                                
                                Spacer()
                                
                                Image("dog")
                                    .resizable()
                                    .scaledToFit()
                                
                                Text("The HIG contains guidance and best practices that can help you design a great experience for any Apple platform.")
                                    .font(.footnote)
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .background(Color.black.opacity(0.2))
                                    .background (.ultraThinMaterial)
                                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))

                            }
                            .padding(.top , 80)
                            .foregroundColor(.white)
                            .frame(height: proxy.size.height * 0.45, alignment: .top)
                            
                            
                            
                            
                            VStack {
                                VStack {
                                    Text("Recent recipes")
                                        .font(.title)
                                        .bold()
                                        .frame(maxWidth: .infinity , alignment: .leading)
                                    
                                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()) , count: 1)) {
                                        ForEach(1..<12) { _ in
                                            rowCtx
                                        }
                                    }
                                }
                                .padding(.vertical)
                                .padding(.horizontal, 12)
                            }
                            .padding(.top , 32)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                        }
                        
                        
                    }
                    .background {
                        LinearGradient(colors: [Color(red: 0.2154892087, green: 0.6470727324, blue: 0.6490081787) , Color(red: 0.1959075928, green: 0.5686405301, blue: 0.6058705688) ], startPoint: .leading , endPoint: .trailing)
                            .ignoresSafeArea(edges: [.vertical])
                    }
                    
                }.ignoresSafeArea(edges: [.vertical])
                
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    var rowCtx : some View {
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

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet()
    }
}
