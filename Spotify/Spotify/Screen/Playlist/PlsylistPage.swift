//
//  PlsylistPage.swift
//  Spotify
//
//  Created by Ryu on 2/6/2023.
//

import SwiftUI

struct PlsylistPage: View {
    
    @Environment(\.dismiss ) var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        Image("yorushika-1")
                            .resizable()
                            .frame(width: proxy.size.width * 0.7 , height: proxy.size.width * 0.7 )
                            
                            
                        
                        VStack(alignment: .leading, spacing: 8 ) {
                            Text("Yorushika - 月光")
                                .fontWeight(.heavy)
                                .font(.title2)
                                
                                
                            HStack {
                                Text("R")
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.cyan)
                                    .foregroundColor(.black)
                                    .cornerRadius(.infinity)
                                
                                Text("Ryu")
                                
                            }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            
                            
                            HStack {
                                Image(systemName: "globe")
                                
                                Text("1時間1分")
                                    
                            }
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                            
                            HStack(spacing: 24) {
                                
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundColor(.green)
                                
                                Image(systemName: "person.badge.plus")
                                
                                Image(systemName: "ellipsis")
                                    .fontWeight(.ultraLight)
                                
                                Spacer()
                                
                                Image(systemName: "shuffle")
                                
                                Image(systemName: "arrowtriangle.right.circle.fill")
                                    .font(.system(size: 38))
                                    .foregroundColor(.green)
                                    
                            }
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .padding(.top , 6)
                            .font(.system(size: 22))
                        }
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.vertical , 24)

                        HStack {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color(red: 0.1411764324, green: 0.1411764324, blue: 0.1411764324))
                                    .frame(width: 50, height: 50)
                                
                                Image(systemName: "plus")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                
                            }
                            .frame(maxWidth: 50, maxHeight: 50)
                            
                            Text("このプリントに追加")
                                .font(.body)
                                .padding(.leading , 6)
                            
                            Spacer()
                        }
                        
                        
                    
                        // start of the playlist
                        ForEach(0..<15) { _ in
                            HStack {
                                Image("yorushika-1")
                                    .resizable()
                                    .frame(maxWidth: 50, maxHeight: 50)
                                
                                HStack {
                                    VStack(alignment: .leading ) {
                                        Text("夕凪、某、花惑い")
                                            .font(.body)
                                            
                                        
                                        HStack{
                                            Image(systemName: "arrow.down.circle.fill")
                                                .foregroundColor(.green)
                                                
                                            Text("ヨルシカ")
                                          
                                                
                                        }
                                        .font(.caption)

                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "ellipsis")
                                        .fontWeight(.ultraLight)
                                        .foregroundColor(.gray)
                                    
                                }
                                .padding(.horizontal , 6)
                                
                                Spacer()
                            }
                            .padding(.vertical , 4)
                            
                        }
                        // end of the playlist
                        
                        VStack(alignment: .leading ) {
                            VStack(alignment: .leading , spacing: 0 ) {
                                Text("おすすめの音楽")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                
                                Text("このプレイリストの曲をベースにしたおすすめ")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                            
                            // start of the playlist
                            ForEach(0..<3) { _ in
                                HStack {
                                    Image("yorushika-1")
                                        .resizable()
                                        .frame(maxWidth: 50, maxHeight: 50)
                                    
                                    HStack {
                                        VStack(alignment: .leading ) {
                                            Text("夕凪、某、花惑い")
                                                .font(.body)
                                                
                                            
                                            HStack{
                                               
                                                    
                                                Text("ヨルシカ")
                                              
                                                    
                                            }
                                            .font(.caption)

                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "plus.circle")
                                            .fontWeight(.light)
                                            .foregroundColor(.white)
                                        
                                    }
                                    .padding(.horizontal , 6)
                                    
                                    Spacer()
                                }
                                .padding(.vertical , 4)
                            }
                            
                            
                            
                            Text("更新")
                                .padding(.vertical , 8 )
                                .padding(.horizontal , 14)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .font(.caption)
                                .bold()
                                .cornerRadius(16)
                                .frame(maxWidth: .infinity)
                           
                        }
                        .padding(.vertical ,12)
                        
                    }
                    
                }
                .padding(.horizontal)
            }
            .background(LinearGradient(colors: [Color(red: 0.3294056058, green: 0.384314537, blue: 0.2509880662) , Color.black], startPoint: .top, endPoint: .bottom))
            .navigationTitle("Yorushika - 月光")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            )
            .navigationBarBackButtonHidden()
            
        }
        .preferredColorScheme(.dark)
       
    }
}

struct PlsylistPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlsylistPage()
        }
    }
}
