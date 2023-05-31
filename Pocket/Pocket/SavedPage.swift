//
//  SavedPage.swift
//  Pocket
//
//  Created by Ryu on 31/5/2023.
//

import SwiftUI

enum SearchTab : String , View, CaseIterable, Identifiable {
    case Saves, Archive, AllItems = "All Items"
    
    var body : some View {
        Text(self.rawValue)
    }
    
    var id : Self { self }
    
    
}

struct SavedPage: View {
    
    @AppStorage("saved") var savedPost : [Article] = []
    
    @State var searchKeyword : String = ""
    @State var searchTab : SearchTab = .Saves
    
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismiss
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
               
//                    Picker(selection: $searchTab ) {
//                        ForEach(SearchTab.allCases) {
//                            $0
//                        }
//                    } label: {
//                        Text("sdf")
//                    }
//                    .pickerStyle(.segmented)
               
                
                    
                ForEach(savedPost, id:\.id) { post in
                    GeometryReader { proxy in
                        
                        VStack(alignment: .trailing) {
                            HStack(alignment: .top) {
                                
                                VStack(alignment: .leading , spacing: 12) {
                                    Text(post.title)
                                        .fontWeight(.semibold)
                                        .lineLimit(3)
                                    
                                    HStack {
                                        Text(post.author)
                                        
                                        
                                        if let time = post.time_needed {
                                            Circle()
                                                .frame(width: 4 , height: 4)
                                            
                                            Text(time + " min")
                                            
                                            
                                        }
                                    }
                                    .font(.footnote)
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                .frame(maxWidth: proxy.size.width * 0.7)
                                
                                Spacer()
                                
                                Image(post.banner_image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: proxy.size.width * 0.2 )
                                    .clipped()
                                    .cornerRadius(12)
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                            HStack(spacing: 12) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.red)
                                
                                
                                ShareLink(item: URL(string: "https://github.com/Ryuuu825/ios-app-clone")! ) {
                                    Image(systemName: "square.and.arrow.up" )
                                }
                                
                                Image(systemName: "ellipsis")
                                
                            }
                            .font(.callout)
                            .foregroundColor(.white)
                            
                        }.padding(.trailing , 12)
                        
                    }
                }
                
                Spacer()
                
                
                
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .navigationTitle("Saves")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchKeyword )
        }
        
        
        
    }
        
}

struct SavedPage_Previews: PreviewProvider {
    static var previews: some View {
        SavedPage()
            .environment(\.colorScheme, .dark)
            
    }
}
