//
//  MyLibrary.swift
//  Spotify
//
//  Created by Ryu on 1/6/2023.
//

// マイライブラリ

import SwiftUI

struct MyLibrary: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack {
                    
                    Text("R")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.cyan)
                        .foregroundColor(.black)
                        .cornerRadius(.infinity)

                    
                    Text("マイライブラリ")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack (spacing: 20 ) {
                        Image(systemName: "magnifyingglass")
                        
                        Image(systemName: "plus")
                        
                    }
                    .font(.title3)
                }
                
                Tags(tags: ["プレイレスト", "アーティスト" , "ダウンロード済み"])

                ScrollView(showsIndicators: false ) {
                    
                    HStack {
                        Image(systemName: "arrow.up.arrow.down")
                            
                            
                        Text("再生履歴")
                            
                        Spacer()
                        
                        Image(systemName: "square.grid.2x2")
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                    }
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.top , 18)
                    
                    VStack {
                        
                        NavigationLink(destination: PlsylistPage()) {
                            
                            HStack {
                                ZStack {
                                    
                                    LinearGradient(colors: [ Color(red: 0.3019181192, green: 0.09418017417, blue: 0.9489968419)  , Color(red: 0.7568323016, green: 0.9176529646, blue: 0.8588226438) ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                   
                                    Image( systemName: "heart.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22 , height: 22)
                                    
                                }.frame(width: 60 , height: 60)
                                    
                                
                                VStack(alignment: .leading , spacing: 2 ) {
                                    Text("お気に入りの曲")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                    
                                    HStack(spacing: 3) {
                                        
                                        HStack(spacing: 3) {
                                            Image(systemName: "pin.fill")
                                                .rotationEffect(.degrees(45))
                                            
                                            Image(systemName: "arrow.down.circle.fill")
                                        }
                                        .foregroundColor(.green)
                                        
                                        HStack(spacing: 3) {
                                            Text("プレイレスト")
                                            Circle()
                                                .frame(width: 4 , height: 4)
                                            Text("8曲")
                                        }
                                        .foregroundColor(.gray)
                                       
                                    }
                                    .font(.footnote)
                                    
                                }
                                .padding(.leading , 6)
                                    
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            
                        }
                        .foregroundColor(.white )
                        
                        HStack {

                            Image( "eva")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60 , height: 60)
                                .clipped()
                             
                                
                            VStack(alignment: .leading , spacing: 2 ) {
                                Text("EVANGELION　「エヴァンゲリオン」シリーズ")
                                    .font(.subheadline)
                                    .lineLimit(1)
                                    .fontWeight(.medium)
                                
                                HStack(spacing: 3) {
                                    
                                    HStack(spacing: 3) {
                                       
                                        Image(systemName: "arrow.down.circle.fill")
                                    }
                                    .foregroundColor(.green)
                                    
                                    HStack(spacing: 3) {
                                        Text("プレイレスト")
                                        Circle()
                                            .frame(width: 4 , height: 4)
                                        Text("Spotify")
                                    }
                                    .foregroundColor(.gray)
                                   
                                }
                                .font(.footnote)
                                
                            }
                            .padding(.leading , 6)

                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        HStack {

                            Image( "hachi-twline")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60 , height: 60)
                                .clipped()
                             
                                
                            VStack(alignment: .leading , spacing: 2 ) {
                                Text("HACHI")
                                    .font(.subheadline)
                                    .lineLimit(1)
                                    .fontWeight(.medium)
                                
                                HStack(spacing: 3) {
                                    
                                    HStack(spacing: 3) {
                                       
                                        
                                        Image(systemName: "arrow.down.circle.fill")
                                    }
                                    .foregroundColor(.green)
                                    
                                    HStack(spacing: 3) {
                                        Text("プレイレスト")
                                        Circle()
                                            .frame(width: 4 , height: 4)
                                        Text("Ryu")
                                    }
                                    .foregroundColor(.gray)
                                   
                                }
                                .font(.footnote)
                                
                            }
                            .padding(.leading , 6)

                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        HStack {

                            Image( "omusic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60 , height: 60)
                                .clipped()
                             
                                
                            VStack(alignment: .leading , spacing: 2 ) {
                                Text("Otographic Music")
                                    .font(.subheadline)
                                    .lineLimit(1)
                                    .fontWeight(.medium)
                                
                                HStack(spacing: 3) {
                                    
                                    HStack(spacing: 3) {
                                       
                                    }
                                    .foregroundColor(.green)
                                    
                                    HStack(spacing: 3) {
                                        Text("プレイレスト")
                                        Circle()
                                            .frame(width: 4 , height: 4)
                                        Text("Philip Nery")
                                    }
                                    .foregroundColor(.gray)
                                   
                                }
                                .font(.footnote)
                                
                            }
                            .padding(.leading , 6)

                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        HStack {

                            Image( "ssong")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60 , height: 60)
                                .clipped()
                             
                                
                            VStack(alignment: .leading , spacing: 2 ) {
                                Text("sad songs to sleep")
                                    .font(.subheadline)
                                    .lineLimit(1)
                                    .fontWeight(.medium)
                                
                                HStack(spacing: 3) {
                                    
                                    HStack(spacing: 3) {
                                       
                                    }
                                    .foregroundColor(.green)
                                    
                                    HStack(spacing: 3) {
                                        Text("プレイレスト")
                                        Circle()
                                            .frame(width: 4 , height: 4)
                                        Text("Heal")
                                    }
                                    .foregroundColor(.gray)
                                   
                                }
                                .font(.footnote)
                                
                            }
                            .padding(.leading , 6)

                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {

                            Image( "yorushika")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60 , height: 60)
                                .clipped()
                             
                                
                            VStack(alignment: .leading , spacing: 2 ) {
                                Text("Yorushika")
                                    .font(.subheadline)
                                    .lineLimit(1)
                                    .fontWeight(.medium)
                                
                                HStack(spacing: 3) {
                                    
                                    HStack(spacing: 3) {
                                        Image(systemName: "arrow.down.circle.fill")
                                    }
                                    .foregroundColor(.green)
                                    
                                    HStack(spacing: 3) {
                                        Text("プレイレスト")
                                        Circle()
                                            .frame(width: 4 , height: 4)
                                        Text("Ryu")
                                    }
                                    .foregroundColor(.gray)
                                   
                                }
                                .font(.footnote)
                                
                            }
                            .padding(.leading , 6)

                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    .padding(.top , 12)
        
                    
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 1)
            .preferredColorScheme(.dark)
        }
    }
}

struct MyLibrary_Previews: PreviewProvider {
    static var previews: some View {
        MyLibrary()
    }
}
