//
//  SearchPage.swift
//  Spotify
//
//  Created by Ryu on 5/6/2023.
//

import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct SearchPage: View {
    
   
    @State var offsetY : CGFloat = 0.0
    
    // let _ = offsetY = proxy.frame(in: .named("scrollView")).minY
    
    var body: some View {
        NavigationStack {
            
            
            
            ZStack {
                
                ScrollView {
                    
                    VStack {
                        
                        GeometryReader { proxy in
                            let _ = offsetY = proxy.frame(in: .global).minY
                            
                            HStack {
                                
                                Text("検索")
                                
                                Spacer()
                                
                                Image(systemName: "camera")
                                    .fontWeight(.regular)
                                    .font(.title2)
                            }
                            .bold()
                            .font(.title)
                            .padding()
                            
                            
                        }
                        
                        Color.clear.frame(width: .infinity , height: 120)
                        
                       
                        
                        VStack(alignment: .leading) {
                            Text("あなたへのおすすめ")
                                .bold()
                            
                            HStack {
                                
                                ZStack {
                                    
                                    Image("yorushika")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 130 , height: 130)
                                    
                                    
                                    Image(systemName: "music.note")
                                        .padding(.trailing , 110)
                                        .padding(.bottom , 100)
                                        .foregroundColor(.white)
                                    
                                    
                                    Text("沉船")
                                        .padding(.leading , 80)
                                        .padding(.bottom , 100)
                                        .foregroundColor(.white)
                                        .fontWeight(.heavy)
                                }
                                    
                                
                                VStack(alignment: .leading , spacing: 1) {
                                    Group {
                                        Text("プレイリスト")
                                            
                                        
                                        Text("沉船")
                                            .foregroundColor(.white)
                                        
                                        Text("歡迎加入感情關注組。特別嘉賓：洪嘉豪")
                                            .lineLimit(2)
                                    }
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                                    .font(.caption)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Image(systemName: "ellipsis")
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrowtriangle.right.circle.fill")
                                            .foregroundColor(.white)
                                            .font(.title)
                                    }
                                    
                                }.padding(6)
                               
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.384342134, green: 0.1215427592, blue: 0.196085155))
                            .cornerRadius(8)
                            
                        }
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding()
                        
                        VStack {
                            
                            Text("すべでのジャンル")
                                .bold()
                                .frame(maxWidth: .infinity , alignment: .leading )
                                .padding(.horizontal)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                                ForEach(1..<32) { _ in
                                    ZStack {
                                        Color(red: 0.2371224403, green: 0.4980538964, blue: 0.8123387027)
                                       
                                        Text("ポッドキャスト")
                                            .padding(.bottom , 60)
                                            .padding(.trailing , 40)
                                            .fontWeight(.heavy)
                                        
                                        Image("yuika-suki")
                                            .resizable()
                                            .frame(width: 65 , height: 65)
                                            .cornerRadius(8)
                                            .rotationEffect(.degrees(28))
                                            .padding(.leading , 155)
                                            .padding(.top , 10)
                                            
                                            
                                     
                                        
                                    }
                                    .frame(maxWidth: 190 , minHeight: 100)
                                    .cornerRadius(8)
                                    .padding(.vertical , 5)
                                }
                            }
                            
                            .padding()
                            
                        }
                        
                    }
                }
                .coordinateSpace(name: "scrollView")
                .frame(maxWidth: .infinity)
                
                
                
                VStack {
                    Spacer()
                    
                    HStack {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .padding(.horizontal , 12)
                        
                        Text("何を聴きたいですか？")
                        
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .frame(width: .infinity , height: 45)
                    .background(.white)
                    .cornerRadius(8)
                    
                    
                }
                .frame(width: .infinity , height: 120)
                .padding()
                .background(offsetY < 0 ? Color.black.ignoresSafeArea(edges:[.horizontal , .vertical]) : Color.clear.ignoresSafeArea(edges:[.horizontal , .vertical]) )
                .position(x: 210 , y : offsetY < 0 ? 0 : offsetY + 10 )
                
            }
            
            
            
        }
        .preferredColorScheme(.dark)
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
    }
}
