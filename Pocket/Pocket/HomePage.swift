//
//  HomePage.swift
//  Pocket
//
//  Created by Ryu on 31/5/2023.
//

import SwiftUI


extension Image {
    func fixedSizeImage( w : CGFloat = .infinity , h : CGFloat = 100 ) -> some View {
        resizable()
        .scaledToFill()
        .frame(maxWidth: w , maxHeight:  h )
        .clipped()
    }
}

struct HomePage: View {
    
    let editors_picks_article : [Article] = [
        .init(title: "How to vent your friend without bring them down", banner_image: "banner", author: "SELF", time_needed: "6"),
        .init(title: "Why you cant remember that taylor swift convert all too well", banner_image: "breakfast", author: "Time", time_needed: "6"),
        .init(title: "revisiting the seven weeks in 1991 that changed the music history forever", banner_image: "breakfast", author: "loudersound.com", time_needed: "9"),
        .init(title: "how to build a better breakfast", banner_image: "breakfast", author: "Pocket", time_needed: nil ),
        .init(title: "what to live longer and healthier? Pater Attia has a plan.", banner_image: "breakfast", author: "The New York Times", time_needed: "14")
    ]
    
    @AppStorage("saved") var savedPost : [Article] = []
    
    var body: some View {
        NavigationView {
            
            VStack {
                ScrollView {
                    
                    VStack {
                        if ( savedPost.isEmpty == false ) {
                            
                            VStack {
                                HStack {
                                    Text("Recent Saves")
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

                                ScrollView(.horizontal , showsIndicators: false) {
                                    HStack {
                                        ForEach(savedPost , id: \.id) { post in
                                            smallCard( article : post )
                                        }
                                    }
                                }
                                .padding(.vertical , 12)
                                .transition(.opacity.animation(.spring()))
                                
                                
                            }
                            .frame(maxWidth: .infinity )
                            .padding()
                            .transition(.opacity.animation(.spring()))
                            
                        }
                        
                    }.id(1)
                    
                    section("Editors' picks", news: editors_picks_article )
                    
                    section("Our most-read Collections", news: editors_picks_article )
                    
                    section("Tens minutes or less ", news: editors_picks_article )
                    
                    section("Long reads worth the time", news: editors_picks_article )
                    
                    section("In case you missed it", news: editors_picks_article )
                    
                    Spacer()
                    
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    @ViewBuilder func footnote( article : Article ) -> some View {
        HStack {
            
            VStack(alignment:.leading) {
                
                Text(article.author)
                
                if let time = article.time_needed {
                    Text("\(time) mins read")
                }
            }
            .font(.caption)
            
            Spacer()
            
            HStack {
                Button {
                    let savedBefore = savedPost.contains { article.id == $0.id }
                    
                    if savedBefore {
                        
                        savedPost.removeAll { article.id == $0.id }
                        
                    } else {
                        savedPost.append(article)
                    }
                    
                } label : {
                    Image(systemName: savedPost.contains { article.id == $0.id }  ? "heart.fill" : "heart" )
                        .foregroundColor(.red)
                }
                
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
        
    @ViewBuilder func bigCard( article : Article ) -> some View {
        VStack {
            Image("banner")
                .fixedSizeImage( h: 200 )
  
            
            VStack( alignment: .leading ) {
                
                Text(article.title)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .lineLimit(2...3)

                footnote(article: article)
                
            }
            .padding(18)
            

        }
        .background(Color(UIColor.secondarySystemBackground))
        .clipped()
        .cornerRadius(18)
    }
    
    @ViewBuilder func smallCard( article : Article ) -> some View {
        VStack(alignment: .leading , spacing: 24 ) {
            
            HStack(alignment: .top ) {
                
                
                Text(article.title.capitalized)
                    .frame(maxWidth: 190 , alignment: .leading )
                    .lineLimit(3)
                    .fontWeight(.medium)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    
                
                Spacer()
                    
                Image(article.banner_image)
                    .fixedSizeImage(w: 80 , h: 64)
                    .cornerRadius(16)
                    
            }
            .frame(height: 72)
            

            footnote(article: article)

        }
        .padding()
        .frame(maxWidth: 350 , maxHeight: 174)
        .background(Color(UIColor.secondarySystemBackground))
        .clipped()
        .cornerRadius(18)
        
    }
     
    @ViewBuilder func section(_ title : String , news : [Article] ) -> some View {
        
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
            
            bigCard( article : news[0])
            

            ScrollView(.horizontal , showsIndicators: false) {
                HStack {
                    ForEach(1..<news.count) { i in
                        smallCard( article : news[i])
                    }
                }
            }.padding(.vertical , 12)
            
            
        }
        .frame(maxWidth: .infinity )
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
       HomePage()
        .environment(\.colorScheme, .dark)
    }
}
