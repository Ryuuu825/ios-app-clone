//
//  HomePageView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 15/6/2023.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        HStack {
                            
                            Image("icon")
                                         .padding(.leading , 12)
                            
                            
                            Spacer()
                            
                            Image(systemName: "percent")
                                .font(.subheadline)
                                .padding(.horizontal)
                                .padding(.trailing , 16)
                                .padding(.vertical , 8)
                                .background {
                                    Color(red: 0.3765017986, green: 0.0587715134, blue: 0.06669519097)
                                }
                                .cornerRadius(.infinity)
                                .offset(x: 20)
                            
                        }
                        
                        HStack {
                            Text("Hello")
                                .bold()
                                .font(.title2)
                            
                            
                            Spacer()
                            
                            HStack {
                                Text("$ 0")
                                    .fontWeight(.heavy)
                                    .font(.title2)
                                    .foregroundColor(Color(red: 0.9058998227, green: 0.8274454474, blue: 0.6941292882))
                                
                                Text("/ $300")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                            }
                        }
                        .padding()
                        
                        HStack {
                            
                           
                                
                            Text("PRE-MEMBER")
                                .font(.caption)
                                .padding(.horizontal,  8)
                                .padding(.vertical,  4)
                                .background {
                                    RoundedCorner(radius: 20, corners: [.topLeft, .bottomRight])
                                        .foregroundColor(.black)
                                }
                                
                            Spacer()
                            
                            
                            Rectangle()
                                .frame(width: 200, height: 12)
                                .cornerRadius(.infinity)
                            
                            Image(systemName: "crown.fill")
                                .font(.caption)
                                .foregroundColor(Color(UIColor.systemGray3))

                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                            
                            Text("Spent $300 and upgrade to VIP")
                                .font(.caption2)
                        }
                        .padding(.horizontal)
                        
                       
                    }
                    
                    VStack {
                        HStack {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)) {
                                
                                VStack {
                                    ZStack(alignment: .center) {
                                        Circle()
                                            .frame(width: 70, height: 70)
                                            .foregroundColor(Color.white)
                                            .shadow(radius: 1, y : 3)
                                       
                                        Image(systemName: "leaf.circle" )
                                            .font(.system(size: 36))
                                        
                                    }
                                    Text("Dine-in")
                                        .fontWeight(.light)
                                        .font(.system(size: 14))
                                }
                                
                                VStack {
                                    ZStack(alignment: .center) {
                                        Circle()
                                            .frame(width: 70, height: 70)
                                            .foregroundColor(Color.white)
                                            .shadow(radius: 1, y : 3)
                                        
                                        Image(systemName: "bag" )
                                            .font(.system(size: 32))
                                        
                                    }
                                    Text("Dine-in")
                                        .fontWeight(.light).font(.system(size: 14))
                                }
                                
                                VStack {
                                    ZStack(alignment: .center) {
                                        Circle()
                                            .frame(width: 70, height: 70)
                                            .foregroundColor(Color.white)
                                            .shadow(radius: 1, y : 3)
                                        
                                        Image(systemName: "doc.on.doc" )
                                            .font(.system(size: 28))
                                        
                                    }
                                    Text("Dine-in")
                                        .fontWeight(.light).font(.system(size: 14))
                                }
                                
                                VStack {
                                    ZStack(alignment: .center) {
                                        Circle()
                                            .frame(width: 70, height: 70)
                                            .foregroundColor(Color.white)
                                            .shadow(radius: 1, y : 3)
                                        
                                        Image(systemName: "qrcode.viewfinder" )
                                            .font(.system(size: 32))
                                        
                                    }
                                    Text("Dine-in")
                                        .fontWeight(.light)
                                        .font(.system(size: 14))
                                }
                                
                            }
                            .padding()
                            .padding(.horizontal)
                            
                           
                        }
                        
                        VStack {
                            HStack {
                                Text("What's Hot")
                                    .foregroundColor(.mainColor)
                                    .bold()
                                
                                Spacer()
                                
                                NavigationLink(destination: NewsPageView()) {
                                    Text("View All")
                                        .fontWeight(.light)
                                        .font(.subheadline)
                                }
                                
                                

                            }
                            
                            TabView {
                                ForEach(1..<5) { _ in
                                    VStack {
                                        Image("ayanami")
                                            .resizable()
                                            .border(Color.mainColor, width: 8)
                                        
                                        
                                        VStack(spacing: 24) {
                                            Text("三哥有payme⚡️")
                                                .fontWeight(.medium)
                                                .frame(maxWidth: .infinity , alignment: .leading)
                                            
                                            
                                            Text("2023/06/01")
                                                .font(.footnote)
                                                .foregroundColor(Color(UIColor.systemGray))
                                            
                                            .frame(maxWidth: .infinity , alignment: .leading)
                                        }
                                        .padding()
                                    
                                        
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: 430)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .padding(.horizontal, 24)
                                    
                                }
                            }
                            .frame(width: .infinity , height: 440)
                            .tabViewStyle(.page)

                            Spacer(minLength: 70)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red: 0.964710772, green: 0.9411751628, blue: 0.9215704799))
                    .cornerRadius(32)
                    .offset(y: 36)
                }
                
            }
            .foregroundColor(.white)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background {
               
                Color(red: 0.5490637422, green: 0.09403692931, blue: 0.08240876347).ignoresSafeArea()
            }
            
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
