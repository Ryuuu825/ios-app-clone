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
                        card()
                    }
                }
            }
            .padding()
            .navigationTitle("Explore")
        }
    }
    
    
    func card(
        title: String = "Human Interface Guidelines",
        description : String = "The HIG contains guidance and best practices that can help you design a great experience for any Apple platform."
    ) -> some View {
        
        let height : CGFloat = 380
        
        return ZStack {
            
            Image("ayanami")
                .resizable()
                .frame( height: height )
                
            VStack(spacing: 4) {
                
                Text(title)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Text(description)
                    .font(.callout)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom , 12)
            .frame(maxWidth: .infinity , maxHeight: 100 , alignment: .leading)
            .blurBackground([Color(red: 0.4, green: 0.4, blue: 0.4)])
            .padding(.top , height - 100)

        }
        .clipedCornerRadius(20)
        .foregroundColor(.white)
        .frame(height: height)
        .padding(.vertical, 12)
        .padding(.horizontal, 4)
    }
    
    
}


struct Two_Previews: PreviewProvider {
    static var previews: some View {
        Two()
    }
}
