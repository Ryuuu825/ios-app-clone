//
//  HomePageView.swift
//  Clubhouse
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                            .background(Color(red: 0.839186728, green: 0.9960841537, blue: 0.9294113517))
                            .foregroundColor(.green)
                            .clipped()
                            .cornerRadius(24)
                            .fontWeight(.bold)
                        
                        
                        Text("start room")
                            .font(.caption)
                            .fontWeight(.black)
                    }
                    .padding()
                    .frame(maxWidth: .infinity , alignment: .leading)
                    
                    VStack {
                        HStack {
                            VStack {
                                Text("join a house for")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                
                                Text("booktok'ers")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.indigo)
                            }
                            .fontWeight(.bold)
                            .font(.title2)
                            
                            
                            Spacer()
                            
                            Image(systemName: "house.fill" )
                                .font(.title)
                                .padding(18)
                                .background {
                                    Color.indigo
                                }
                                .cornerRadius(24)
                                .overlay {
                                    Image(systemName: "book.fill")
                                        .offset(x: -30 , y: 25)
                                        .font(.headline)
                                }
                        }
                        
                        
                        Text("enjoy gread conversations, once a week, with just your peopl. no driving or dressing up, just open your phone and say hi")
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .font(.callout)
                        
                        
                        Button {} label: {
                            Text("explore houses")
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.vertical , 6)
                                .fontWeight(.semibold)
                                .background {
                                    Color.blue
                                }
                                .clipped()
                                .cornerRadius(24)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke( Color(UIColor.secondarySystemBackground), lineWidth: 6 )
                    }
                    .cornerRadius(20)
                    
                    
                    VStack {
                        Text("open rooms")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            
                        ForEach(1..<12) { _ in
                            VStack {
                                HStack {
                                    Image("ayanami")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .cornerRadius(.infinity)
                                        
                                    Text("Our Mindset")
                                        
                                    
                                    Spacer()
                                    
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                
                                Text("More success in Your Life, by listening in 📡😊 ")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack(alignment: .top) {
                                    
                                    ZStack {
                                        Image("ayanami")
                                            .resizable()
                                            .frame(width: 50 , height: 50)
                                            .cornerRadius(.infinity)
                                        
                                        Image("ayanami")
                                            .resizable()
                                            .frame(width: 50 , height: 50)
                                            .cornerRadius(.infinity)
                                            .offset(x: 20 , y: 20)
                                    }
                                    .frame(width: 70)
                                    .padding(.trailing , 30)
                                    
                                    
                                    
                                    VStack(spacing: 8) {
                                        Text("Ryu Lee 💬")
                                        Text("Ryu Lee 💬")
                                        
                                        HStack(spacing: 3 ) {
                                            Image(systemName: "person")
                                            Text("30")
                                            
                                            Color.clear.frame(width: 4)
                                            
                                            Image(systemName: "ellipsis.message")
                                            Text("2")

                                        }
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                        .font(.subheadline)
                                    }
                                    .fontWeight(.regular)
                                    
                                    Spacer()
                                }
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(12)
                            .padding(.vertical , 4)
                            
                        }
                    }
                    .padding(.vertical , 12)
                    .frame(maxWidth: .infinity , alignment: .leading)
                }
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navigationBar_leading)
        .navigationBarItems(trailing:  navigationBar_trailing)
    }
    
    
    var navigationBar_leading : some View {
        Text("Clubhouse")
            .fontWeight(.heavy)
            .font(.title)
    }
    
    var navigationBar_trailing : some View {
        HStack(spacing: 24) {
            ZStack {
                Image(systemName: "bell")
                
                Circle()
                    .frame(width: 10 , height: 10)
                    .foregroundColor(.red)
                    . offset(x: 7 , y: -10)
            }
                
            Image(systemName: "paperplane")
                
            
            Text("RL")
                .padding(12)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(.infinity)
                .fontWeight(.regular)
        }
        .fontWeight(.bold)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomePageView()
        }
        .environment(\.colorScheme, .dark)
    }
}
