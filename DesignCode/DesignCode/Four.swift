//
//  Four.swift
//  DesignCode
//
//  Created by Ryu on 9/6/2023.
//

import SwiftUI

struct Four: View {
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    HStack(alignment: .top , spacing: 16) {
                        ForEach(1..<3) { _ in
                            VStack {
                                ForEach(1..<10) { _ in
                                    image
                                }
                            }
                            .frame(width: proxy.size.width * 0.45 )
                        }
                        
                    }
                    .padding(.horizontal)
                    .navigationTitle("Explore")
                    
                }
                .padding(.vertical)
            }
        }
    }
    
    var image : some View {
        Image("ayanami")
            .resizable()
            .frame(height: CGFloat(Int.random(in: 100..<350)))
            .cornerRadius(24)
            .clipped()
    }
}

struct Four_Previews: PreviewProvider {
    static var previews: some View {
        Four()
    }
}
