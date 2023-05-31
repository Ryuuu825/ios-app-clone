//
//  HomePage.swift
//  Spotify
//
//  Created by Ryu on 31/5/2023.
//

import SwiftUI



struct HomePage: View {
    var body: some View {
        VStack {
            
            ScrollView(showsIndicators: false ) {
                
                HStack {
                    Text("こんばんは")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    HStack (spacing: 20 ) {
                        Image(systemName: "bell.badge")
                        
                        Image(systemName: "timer")
                        
                        Image(systemName: "gearshape" )
                    }
                    .font(.title3)
                }
                
                HStack {
                    Group {
                        Text("音楽")
                        Text("ポッドキャストと番組")
                    }
                    .font(.footnote)
                    .padding(.horizontal , 12)
                    .padding(.vertical , 6)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(24)
                    
                    
                }
                .padding(.vertical , 1)
                .frame(maxWidth: .infinity , alignment: .leading)
                
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                    
                    HStack {
                        Image("yuika-suki")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55 , height: 55)
                            .clipped()
                        
                        Text("ユイカ")
                            .font(.footnote)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(4)
                    
                    HStack {
                        Image("hachi-twline")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55 , height: 55)
                            .clipped()
                        
                        Text("HACHI")
                            .font(.footnote)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(4)
                    
                    HStack {
                        Image("eva")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55 , height: 55)
                            .clipped()
                        
                        
                        Text("エヴァンげlイオン")
                            .font(.footnote)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(4)
                    
                    HStack {
                        Image("yorushika")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55 , height: 55)
                            .clipped()
                        
                        Text("Yorushika - 月光")
                            .font(.footnote)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(4)
                    
                    
                    
                }
                .padding(.vertical , 12)
                
                section("自分のプレイレスト") {
                    
                    playlist_1("ユイカ" , image: "yuika-suki")
                    
                    playlist_1("HeyHeyHey" , image: "2")
                    
                    playlist_1("Yourshika" , image: "yorushika")
                    
                   
                }
                
                section("自分のプレイレスト") {
                    
                    playlist_2("ヨルシカ" , image: "yorushika")
                    
                    playlist_2("ユイカ" , image: "yuika-suki")
                    
                    playlist_2("ヨルシカ" , image: "yorushika")
                    
                    playlist_2("ユイカ" , image: "yuika-suki")
                    
                    playlist_2("ヨルシカ" , image: "yorushika")
                    
                    playlist_2("ユイカ" , image: "yuika-suki")
                    
                }
                
                
                section("人気のアーティスト") {
                    
                    playlist_3( "綾波麗" , image: "1")
                    
                    playlist_3( "FIFTY FIFTY" , image: "5050")
                    
                    playlist_3( "角卷綿芽" , image: "watame")
                    
                }
                
                
                
                
            }
        }
        .preferredColorScheme(.dark)
        .padding(.horizontal)
        .padding(.vertical, 1)
    }
    
    @ViewBuilder func playlist_1( _ title : String , image : String ) -> some View {
        
        VStack {
            
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 150 , maxHeight: 150)
                .clipped()
            
            Text(title)
                .font(.footnote)
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding(.top , 3)
            
            
            Text("プレイレスと")
                .font(.caption)
                .foregroundColor(Color(UIColor.secondaryLabel))
                .multilineTextAlignment(.leading)
                .lineLimit(2...3)
                .frame(maxWidth: .infinity , alignment: .leading)
        }
        
    }
    
    @ViewBuilder func playlist_2( _ title : String , image : String ) -> some View {
        
        VStack {
            
            VStack(spacing:0) {
                
                ZStack {
                    Rectangle()
                        .frame(width: 150, height: 60)
                    
                    VStack {
                        Text("This is")
                            .fontWeight(.semibold)
                            .font(.caption2)
                        
                        Text(title)
                            .fontWeight(.bold)
                            .font(.callout)
                        
                    }.foregroundColor(.black)
                        
                }
                    
                
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 90)
                    .clipped()
                
            }
            .frame(maxWidth: 150, maxHeight: 150)
                

            Text(title)
                .font(.caption)
                .foregroundColor(Color(UIColor.secondaryLabel))
                .multilineTextAlignment(.leading)
                .lineLimit(2...3)
                .frame(maxWidth: .infinity , alignment: .leading)
        }
        
    }
    
    @ViewBuilder func playlist_3( _ title : String , image : String ) -> some View {
        
        VStack(alignment: .center ) {
 
                    
                
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(.infinity)
            
         
                

            Text(title)
                .font(.footnote)
                .foregroundColor(Color(UIColor.label))
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .frame(maxWidth: .infinity , alignment: .center)
                .fontWeight(.medium)
                .padding(.top , 3)
        }
        
    }
    
    
    @ViewBuilder func section( _ title : String , @ViewBuilder content : @escaping () -> some View ) -> some View {
        VStack {
            
            Text(title)
                .frame(maxWidth: .infinity , alignment: .leading )
                .font(.title2)
                .fontWeight(.heavy)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16 ) {
                    content()
                }
            }
        }
        .padding(.vertical , 12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environment(\.colorScheme, .dark)
    }
}
