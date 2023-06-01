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
                    
                    HStack {
                        ZStack {
                            
                            LinearGradient(colors: [ Color(red: 0.3019181192, green: 0.09418017417, blue: 0.9489968419)  , Color(red: 0.7568323016, green: 0.9176529646, blue: 0.8588226438) ], startPoint: .topLeading, endPoint: .bottomTrailing)
                           
                            Image( systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18 , height: 18)
                            
                        }.frame(width: 55 , height: 55)
                            
                        
                        Text("お気に入りの曲")
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
                
                section("インターネット発音楽力ルチャー") {
                    
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
                        .frame(width: 150, height: 55)
                    
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
    
    
    @ViewBuilder func playlist_4( _ title : String , desc : String ,  image : String ) -> some View {
        
        let colors = [ Color(red: 0.6156104207, green: 0.9372660518, blue: 0.8862698674) , Color(red: 0.9961079955, green: 0.8078332543, blue: 0.8235346079) ]
        let color = colors.randomElement()


        VStack(alignment: .center ) {
 
                    
                
            ZStack {
                
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 150 , maxHeight: 150)
                    .clipped()
                
                Color.black.opacity(0.45)
                
                Image(systemName: "music.note")
                    .foregroundColor(.white)
                    .padding(.bottom , 120)
                    .padding(.trailing , 120)
                
                Text(title + " Mix")
                    .padding(.top , 100)
                    .fontWeight(.black)
                    .font(.system(size: 16 ))
                    .padding(.trailing , 6)
                
                Rectangle()
                    .frame(maxWidth: .infinity , maxHeight: 5)
                    .foregroundColor(color)
                    .padding(.top , 145)
                
                
                Rectangle()
                    .frame(maxWidth: 6 , maxHeight: 15)
                    .foregroundColor(color)
                    .padding(.top , 100)
                    .padding(.trailing , 144)
               
            }
            
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
