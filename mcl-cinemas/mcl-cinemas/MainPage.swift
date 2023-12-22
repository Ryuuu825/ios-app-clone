//
//  MainPage.swift
//  mcl-cinemas
//
//  Created by Ryu on 22/12/2023.
//

import SwiftUI

extension Color {
    static let mainColor : Color = Color(red: 242/255 , green:100/255, blue: 1/255);
    static let secColor : Color = Color(red: 1, green: 0.5951295495, blue: 0);
    static let cbgColor : Color = Color(red: 0.06042201072, green: 0.0659404695, blue: 0.1532291174);
    static let cbgColor2 : Color = Color(red: 0.1134429052, green: 0.1185233369, blue: 0.2053279579);
    static let bgColor : Color = Color(red: 0.06042201072, green: 0.08748871833, blue: 0.1385272741);
}



struct CinemaDetail : Codable {
    let id : String
    let n : String
    let a : String
}

struct MovieD : Codable {
    let ba : String
    let dba : String
    let dgu : String
    let dp : String
    let du : String
    let gba : String
    let gp : String
    let movies : [MoveDetails]
    let ta : String
}

struct MoveDetails : Codable {
    let id : String
    let ls : String
    let mn : String
    let t  : String
}


struct MainPage: View {
    
    let cinemaImage : [String] = ["k11" , "mt" , "fw" , "as" , "to", "grand-windsor" , "metro" , "star" , "kh"]
    let movies: [String] = ["V-13253" , "V-13266",  "V-13106" , "V-12989" , "V-13137"]
    
    @State var cinema : [CinemaDetail] = []
    @State var moives : MovieD? = nil
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                LinearGradient(colors: [.mainColor, .secColor], startPoint: .leading, endPoint: .trailing)
                    .mask {
                        VStack {
                            Text("MCL")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .italic()
                            
                            Text("CINEMAS")
                                .font(.system(size: 10))
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.mainColor)
                    }
                    .frame(height: 50)
                
                Image(systemName: "gearshape")
                    .font(.headline)
                    .foregroundColor(.white)
                    .offset(x: 180)
            }
            .padding(.bottom)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.04416629672, green: 0.0659404695, blue: 0.1134429052))
            
            ScrollView {
                VStack(spacing: 4) {
                    
                    HStack {
                        Text("你好, Ryu")
                            .font(.title2)
                            
                        Spacer()
                        
                        HStack {
                            
                            Image("mcoins")
                                .resizable()
                                .scaledToFill()
                                .frame( width: 25 , height: 25)
                            
                            Text("992")
                                .foregroundColor(.secColor)
                                .font(.title2)
                            
                           
                        }
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    
                    HStack {
                        Text("歡迎！")
                            .foregroundColor(.secColor)
                            
                        Spacer()
                        
                        HStack {
                            Image(systemName: "qrcode")
                                .font(.system(size: 20))
                            Text("會員卡")
                                .font(.system(size: 14))
                        }
                        .bold()
                        .font(.system(size: 16))
                        .padding(.horizontal , 32)
                        .padding(.vertical , 8)
                        .background(Color(red: 0.1819669902, green: 0.1960422695, blue: 0.2684496939))
                        .cornerRadius(300)
                    }
                    .font(.title3)
                    .foregroundColor(.white)
                    
                    
                }
                .padding()
                .padding(.horizontal , 12)
                .padding(.vertical , 24)
                .frame(maxWidth: .infinity)
                .background {
                    ZStack {
                       
                        Color.cbgColor
                        
                        
                        Group {
                            Circle()
                                .offset(x: -30 , y: 100)
                            
                            Circle()
                                .offset(x: -30 , y: 80)
        
                            Circle()
                                .offset(x: 5 , y: 55)
                            
                            
                            Circle()
                                .offset(x: 30 , y: 70)
                            
                            
                            Circle()
                                .scale(3)
                                .offset(x: 260 , y: 0)
                        }
                        .foregroundColor(Color.cbgColor2)
                        
                        Group {
                            Circle()
                                .scale(1.3)
                                .offset(x: 53 , y: -110)
                        }
                        .foregroundColor(Color.cbgColor)
                            
                        
                        
                    }
                }
                .cornerRadius(24)
                .padding(12)
                
                
                
                VStack {
                    HStack {
                        Text("現正發售")
                        
                        Spacer()
                        
                        Group {
                            Text("更多")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.secColor)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal , showsIndicators: false) {
                        HStack {
                            if moives != nil {
                                ForEach(moives!.movies, id:\.id) { str in
                                    VStack(alignment: .leading) {
                                        AsyncImage(url: URL(string:"https://www.mclcinema.com/Images/\(str.t == "S" ? "Movies" : "Group")/\(str.t == "S" ? "V" : "GI-M")-\(str.id).jpg")) { image in
                                            image
                                                .resizable()
                                                .frame(width: 120 , height: 180)
                                            
                                            Text(str.mn)
                                                .frame(width: 120, height: 30, alignment: .topLeading)
                                                .font(.system(size:12))
                                            
                                        } placeholder: {
                                            
                                        }
                                        
                                    }
                                    .frame(width:120, height: 230, alignment: .leading)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 3)
                                }
                            }
                        }
                        .onAppear {
                            let url = URL(string: "https://www.mclcinema.com/MCLWebAPI2/GetNowShowingGrid.aspx?l=1")!
                            URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r , e in
                                guard let data = d else { return }
                                moives = try? JSONDecoder().decode(MovieD.self, from: data)
                            }.resume()
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom , 12)
                
                VStack {
                    HStack {
                        Text("戲院")
                        
                        Spacer()
                        
                        Group {
                            Text("更多")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.secColor)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal , showsIndicators: false) {
                        HStack {
                            ForEach(cinema, id:\.id) { c in
                                
                                
                                
                                VStack {
                                    AsyncImage(url: URL(string: "https://www.mclcinema.com/Content/Image/MCLCinemas/\(cinemaImage.randomElement()!).jpg")) { image in
                                        ZStack {
                                            image
                                                .resizable()
                                                .overlay {
                                                    Color.black.opacity(0.5)
                                                }
                                                .frame(width: 140 , height: 140)

                                            VStack {
                                                Text("\(c.n)")

                                            }
                                            .font(.system(size: 14))
                                            .bold()
                                            .frame(maxWidth: 120, alignment: .center)
                                            .multilineTextAlignment(.center)
                                        }
                                        .cornerRadius(4)

                                    } placeholder: {

                                    }

                                    
                                    
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 4)
                            }
                        }
                        .onAppear {
                            let url = URL(string: "https://www.mclcinema.com/MCLWebAPI2/GetCinemaDetails.aspx?l=1")!
                            URLSession.shared.dataTask(with: URLRequest(url: url)) { d , r , e in
                                
                                guard let data = d else { return }
                                cinema = try! JSONDecoder().decode([CinemaDetail].self, from: data)
                                
                               
                            }
                            .resume()
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 12)

                
            }
            
        
        }
        .background(Color.bgColor)
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
