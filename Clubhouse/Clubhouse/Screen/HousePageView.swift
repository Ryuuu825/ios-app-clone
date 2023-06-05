//
//  HousePageView.swift
//  Clubhouse
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI

struct HousePageView: View {
    var body: some View {
        VStack {
            HStack(spacing: 32 ) {
                Text("houses")
                    .font(.title)
                
                Spacer()
                
                Text("edit")
                
                Image(systemName: "plus")
                    .fontWeight(.bold)
            }
            .fontWeight(.medium)
            
            
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
            
            ScrollView {
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
                .padding(.bottom , 20)
                
                
                
                GeometryReader { proxy in
                    
                    VStack {
                        Image(systemName: "plus")
                            .padding(.vertical, 72)
                            .frame(maxWidth: .infinity)
                            .background()
                            .clipped()
                            .cornerRadius(12)
                            .bold()
                            .font(.title)
                        
                        VStack {
                            HStack {
                                
                                Circle()
                                    .frame(width: 12, height: 12)
                                
                                Circle()
                                    .frame(width: 12, height: 12)
                                
                                Circle()
                                    .frame(width: 12, height: 12)
                                
                                Circle()
                                    .frame(width: 12, height: 12)
                                
                                Circle()
                                    .frame(width: 12, height: 12)
                                    
                                    
                            }
                            
                            Text("New house")
                        }
                        .font(.caption)
                        
                            
                        
                    }
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding(8)
                    .frame(width: proxy.size.width * 0.48)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                    
                }
                
            }
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background()
        
        
        
    }
}

struct HousePageView_Previews: PreviewProvider {
    static var previews: some View {
        HousePageView()
            .environment(\.colorScheme, .dark)
    }
}
