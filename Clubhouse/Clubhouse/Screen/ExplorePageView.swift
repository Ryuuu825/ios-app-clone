//
//  ExplorePageView.swift
//  Clubhouse
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI

struct ExplorePageView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        ZStack {
                           
                            
                            Text("EXPLORE")
                                .fontWeight(.medium)
                            
                            Image(systemName: "calendar")
                                .font(.title2)
                                .padding(.horizontal )
                                .frame(maxWidth: .infinity , alignment: .trailing)
                        }
                        
                    }
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("search clubhouse")
                        
                        Spacer()
                    }
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(.infinity)
                    .clipped()
                    .padding()
                    
                }
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        Text("people to follow")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            
                        
                        ForEach(1..<3) { _ in
                            HStack {
                                Image("ayanami")
                                    .resizable()
                                    .frame(width: 60 , height: 60)
                                    .cornerRadius(.infinity)
                                
                                VStack(alignment: .leading) {
                                    Text("Ayanami Rei")
                                        .fontWeight(.semibold)
                                    
                                    Text("@ayanami")
                                        .font(.subheadline)
                                }
                                
                                
                                Spacer()
                                
                                Text("Follow")
                                    .fontWeight(.semibold)
                                    .padding(.horizontal)
                                    .padding(.vertical , 6)
                                    .background {
                                        Color(UIColor.link)
                                    }
                                    .cornerRadius(.infinity)
                                
                            }
                        }
                        
                        Text("More people to follow")
                            .padding(.horizontal)
                            .padding(.vertical , 6)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(.infinity)
                            .frame(maxWidth: .infinity ,alignment: .center)
                            
                            
                    }
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.bottom , 32)
                    
                    
                    VStack(alignment: .leading) {
                        Text("houses to follow")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            
                        
                        ForEach(1..<4) { _ in
                            HStack {
                                Image("ayanami")
                                    .resizable()
                                    .frame(width: 60 , height: 60)
                                    .cornerRadius(12)
                                
                                VStack(alignment: .leading) {
                                    Text("Ayanami Rei Fanclub")
                                        .fontWeight(.semibold)
                                    
                                    Text("A fanclub for ayanami")
                                        .font(.subheadline)
                                }
                                
                                
                                Spacer()
                                
                                Text("request")
                                    .fontWeight(.semibold)
                                    .padding(.horizontal)
                                    .padding(.vertical , 6)
                                    .background {
                                        Color(UIColor.link)
                                    }
                                    .cornerRadius(.infinity)
                                
                            }
                        }
                        
                        Text("More houses to follow")
                            .padding(.horizontal)
                            .padding(.vertical , 6)
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(.infinity)
                            .frame(maxWidth: .infinity ,alignment: .center)
                            
                            
                    }
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.bottom , 32)
                    
                    VStack(alignment: .leading) {
                        Text("houses to follow")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            
                        
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(maximum: 200) , alignment: .leading) , count: 2) , alignment: .leading, spacing: 10) {
                            ForEach(1..<9) { _ in
                                HStack {
                                    Text([" 🍎 Health" , " 💊 Medicine" , " 🧘‍♂️ Mindfullness"].randomElement()!)
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(Color(UIColor.link))
                                    
                                }
                                .padding(12)
                                .background(Color(UIColor.secondarySystemBackground))
                                .cornerRadius(12)
                            }
                        }
                        .gridColumnAlignment(.leading)
                        
                        
                        Text("browse all topics")
                            .padding(.horizontal)
                            .padding(.vertical , 6)
                            .fontWeight(.medium)
                            .font(.system(size: 14))
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(.infinity)
                            .frame(maxWidth: .infinity ,alignment: .center)
                            
                            
                    }
                    .frame(maxWidth: .infinity , alignment: .leading)
                    
                }
                .padding()
            }
            .background()
            
        }
    }
}

struct ExplorePageView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePageView()
            .environment(\.colorScheme, .dark)
    }
}
