//
//  NewsPageView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 12/6/2023.
//

import SwiftUI

struct NewsPageView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
            VStack(spacing: 0) {
               
                ZStack {
                    GeometryReader { proxy in
                        Text("News")
                            .frame(maxWidth: .infinity , alignment: .center)
                            .bold()
                            .font(.title2)
                        
                        Button { dismiss() } label: {
                            Image(systemName: "arrow.left")
                                .padding(.horizontal)
                                .padding(.top, 4)
                                .font(.title3)
                        }
                    }
                }
                .padding(.bottom, 8)
                .background(RoundedCorner(radius: 24, corners: [.bottomLeft]).ignoresSafeArea().foregroundColor(.mainColor))
                .foregroundColor(.white)
                .frame(height: 50)
                
                
                ScrollView {
                    VStack {
                        ForEach(1..<5) { _ in
                            VStack {
                                Image("ayanami")
                                    .resizable()
                                    .border(Color.mainColor, width: 8)
                                
                                
                                VStack(spacing: 0) {
                                    Text("三哥有payme⚡️")
                                    
                                        .font(.system(size: 17))
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity , alignment: .leading)
                                        .padding(.bottom , 8)
                                    
                                    Text("三粉留意 由即日起黎三哥可以周 #payme 畀錢啦三粉留意 由即日起黎三哥可以周 #payme 畀錢啦")
                                        .font(.system(size: 16))
                                        .fontWeight(.light)
                                        .lineLimit(1)
                                        .frame(maxWidth: .infinity , alignment: .leading)
                                        .padding(.bottom , 24)
                                    
                                    Text("2023/06/01")
                                        .font(.footnote)
                                        .foregroundColor(Color(UIColor.systemGray))
                                    
                                        .frame(maxWidth: .infinity , alignment: .leading)
                                }
                                .padding()
                                
                                
                            }
                            .frame(width: .infinity, height: 530)
                            .background(Color.white)
                            .cornerRadius(12)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            
                        }
                    }
                }
                .background(Color(UIColor.secondarySystemBackground))
                
            }
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarBackButtonHidden()
        
        
    
    }
}

struct NewPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsPageView()
        }
    }
}
