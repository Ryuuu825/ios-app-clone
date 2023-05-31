//
//  HomePage.swift
//  Pocket
//
//  Created by Ryu on 31/5/2023.
//

import SwiftUI

struct HomePage: View {
    
    
    let editors_picks_news = [
        "How to Vent Your Friends Without Bringing Them Down",
        "Why you cant remember that taylor swift convert all too well",
        "revisiting the seven weeks in 1991 that changed the music history forever",
        "how to build a better breakfast",
        "what to live longer and healthier? Pater Attia has a plan."
    ]
    
    var body: some View {
        NavigationStack {
           
            ScrollView {
                
                section("Editors' picks", news: editors_picks_news )
                
                section("Our most-read Collections", news: editors_picks_news )
                
                section("Tens minutes or less ", news: editors_picks_news )
                
                section("Long reads worth the time", news: editors_picks_news )
                
                section("In case you missed it", news: editors_picks_news )
                
                Spacer()
            }
            

            
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
    }
    
    
    @ViewBuilder func section(_ title : String , news : [String] ) -> some View {
        
        VStack {
            HStack {
                Text(title.capitalized)
                    .fontWeight(.semibold)
                    .font( .title3 )
                
                Spacer()
                
                HStack {
                    Button {} label: {
                        Text("See all")
                            .fontWeight(.regular)
                            
                        Image(systemName: "chevron.right")
                            .font(.caption)
                    }
                    
                }.foregroundColor(Color.cyan)
            }
            
            VStack {
                Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity , maxHeight:  200 )
                    .clipped()
                
                
                VStack( alignment: .leading ) {
                    
                    Text(news[0])
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .lineLimit(2...3)
                        
                    
                    
                    HStack {
                        
                        VStack(alignment:.leading) {
                            
                            Text("SELF")
                            
                            Text("6 mins read")
                        }
                        .font(.caption)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "heart" )
                            
                            Menu {
                                Button {} label: {
                                    Label("Share" , systemImage: "square.and.arrow.up")
                                }
                                
                                Button {} label: {
                                    Label("Share" , systemImage: "info.circle")
                                }
                                
                            } label: {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(Color(UIColor.label))
                            }
                        }
                        
                        
                    }
                }
                .padding(18)
                

            }
            .background(Color(UIColor.secondarySystemBackground))
            .clipped()
            .cornerRadius(18)
            
            
            ScrollView(.horizontal , showsIndicators: false) {
                HStack {
                    ForEach(1..<news.count) { i in
                        VStack(alignment: .leading , spacing: 24 ) {
                            
                            HStack(alignment: .top  ) {
                                
                                
                                Text(news[i].capitalized)
                                    .frame(maxWidth: 190 , alignment: .leading )
                                    .lineLimit(3)
                                    .fontWeight(.medium)
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                    
                                
                                Spacer()
                                    
                                Image("breakfast")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: 80 , maxHeight:  64 )
                                    .clipped()
                                    .cornerRadius(16)
                                    
                            }
                            
                            
                            
                                
                            HStack {
                                
                                VStack(alignment:.leading) {
                                    
                                    Text("SELF")
                                    
                                    Text("6 mins read")
                                }
                                .font(.caption)
                                
                                Spacer()
                                
                                HStack {
                                    Image(systemName: "heart" )
                                    
                                    Menu {
                                        Button {} label: {
                                            Label("Share" , systemImage: "square.and.arrow.up")
                                        }
                                        
                                        Button {} label: {
                                            Label("Share" , systemImage: "info.circle")
                                        }
                                        
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(Color(UIColor.label))
                                    }
                                }
                                
                                
                            }

                        }
                        .padding()
                        .frame(maxWidth: 350 , maxHeight: 174)
                        .background(Color(UIColor.secondarySystemBackground))
                        .clipped()
                        .cornerRadius(18)
                        .padding(.vertical , 12)
                    }
                }
            }
            
            
        }
        .frame(maxWidth: .infinity )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomePage()
        }.environment(\.colorScheme, .dark)
    }
}
