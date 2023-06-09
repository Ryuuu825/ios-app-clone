//
//  Two.swift
//  DesignCode
//
//  Created by Ryu on 9/6/2023.
//

import SwiftUI


struct Two : View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()) , count: 1)) {
                    ForEach(1..<5) { _ in
                        ZStack {
                            
                            Image("ayanami")
                                .resizable()
                                .frame( height: 380 )
                                
                            VStack(spacing: 4) {
                                
                                Text("Human Interface Guidelines")
                                    .font(.title3)
                                    .bold()
                                    
                                
                                Text("The HIG contains guidance and best practices that can help you design a great experience for any Apple platform.")
                                    .font(.callout)
                                    .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                                    .lineLimit(2)
                                
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical , 12)
                            .frame(maxWidth: .infinity , maxHeight: 120 , alignment: .leading)
                            .blurBackground([Color(red: 0.4, green: 0.4, blue: 0.4)])
                            .padding(.top , 260)

                        }
                        .clipedCornerRadius(20)
                        .foregroundColor(.white)
                        .frame(height: 380)
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


struct Two_Previews: PreviewProvider {
    static var previews: some View {
        Two()
    }
}
