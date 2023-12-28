//
//  MoiveCheckout.swift
//  mcl-cinemas
//
//  Created by Ryu on 22/12/2023.
//

import SwiftUI
import AVKit

struct SessionD : Codable {
    let vc : String
    let v : String
    let l : String
    let vn : String
    let sd : [SessionDetailD]
}

struct SessionDetailD : Codable {
    let n : String
    let c : [SessionDetailP]
}

struct SessionDetailP : Codable {
    let ci : String
    let cn : String
    let o : Int
    let s : [SessionDetail]
}

struct SessionDetail : Codable {
    let si : Int
    let sn : String
    let r : Int

}

// movie details

struct MovieDetails : Codable {
    let t : String
    let id : Int
    let mn : String
    let b : MovieCup
    let e : ActorList
    let i : String
    let m : MovieVideo
}

struct MovieCup : Codable {
    let mg : String
    let mrt : String
    let mc : String
    let ml : String
    let ms : String
    let rd : String
}

struct ActorList : Codable {
    let md : String
    let mc : String
}

struct MovieVideo : Codable {
    let ttp : String
    let tta : String
    let su : String
    let shp : String
    let ssp : String
    let stp : String
    let sta : String
    let trs : [trsC]
    let sts : [String]
}

struct trsC : Codable {
    let id : String
}

struct DF {
    static func toDate(str: String) -> String {
        let df = DateFormatter()
        df.dateFormat = "dd/mm"
        let d = df.date(from: str)!
        df.dateFormat = "mm月dd日"
        return df.string(from: d)
    }
    
    static func toDate(str: String) -> Date {
        let df = DateFormatter()
        df.dateFormat = "dd/mm"
        df.locale = Locale(identifier: "zh-HK")
        return df.date(from: str)!
    }
    
    static func isSameDay(str1: String , str2: String ) -> Bool {
        let d : Date = DF.toDate(str: str1)
        let d2 : Date  = DF.toDate(str: str2)
        return d == d2
    }
    
    static func isSameDay(d: Date , str: String ) -> Bool {
        let d2 : Date  = DF.toDate(str: str)
        return d == d2
    }
    
    static func convertTo24HourFormat(time: String, amPm: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let date = dateFormatter.date(from: "\(time) \(amPm)")
        
        dateFormatter.dateFormat = "HH:mm"
        let convertedTime = dateFormatter.string(from: date!)
        
        return convertedTime
    }

}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        return try? NSAttributedString(data: data, options: options, documentAttributes: nil)
    }
}


struct MoiveCheckout: View {
    
    @State var movieId : Int
    
    @State var session : Bool = true
    @State var sessionInfo : [SessionD] = []
    @State var movieDetail : MovieDetails? = nil
    
    @State var selectedDay : Date = Date.now
    @State var dayAvabile : [String] = []
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(red: 0.06042201072, green: 0.08748871833, blue: 0.1385272741)
                
                GeometryReader { proxy in
                    if movieDetail != nil {
                        let m = movieDetail!
                        
                        ScrollView {
                            VStack {
                                
                                header(m)
                               
                                HStack {
                                    Text("場次")
                                        .frame(width: 200)
                                        .foregroundColor( session ? Color.mainColor : Color.gray)
                                        .overlay {
                                            Rectangle()
                                                .frame(height: 2)
                                                .foregroundColor( session ? Color.mainColor : Color.clear)
                                                .offset(y: 25)
                                        }
                                        .onTapGesture {
                                            session = true
                                        }

                                    Text("電影資訊")
                                        .frame(width: 200)

                                        .foregroundColor( !session ? Color.mainColor : Color.gray)
                                        .overlay {
                                            Rectangle()
                                                .frame(height: 2)
                                                .foregroundColor( !session ? Color.mainColor : Color.clear)
                                                .offset(y: 25)
                                        }
                                        .onTapGesture {
                                            session = false
                                        }
                                }
                                .frame(width: .infinity, height: 50)
                                .background(Color.cbgColor)
                                
                            
                                if session {
                                    let s = sessionInfo
                                    
                                    if s.count != 0 {
                                        
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                ForEach(dayAvabile , id:\.hashValue) { sd in
                                                    HStack {
                                                        VStack {
                                                            Text(DF.toDate(str: sd))
                                                                .frame(height: 12)

                                                            Text(DF.toDate(str: sd).formatted(.dateTime.weekday()))
                                                        }
                                                        .font(.system(size: 16))
                                                        .padding(.horizontal , 4)
                                                        .padding(.top, 20)
                                                        .foregroundColor( DF.isSameDay(d: selectedDay , str: sd) ? .white : .gray)

                                                        Rectangle()
                                                            .frame(width: 1.3, height: 30)
                                                            .foregroundColor(.gray)
                                                            .padding(.top , 12)
                                                    }
                                                    .onTapGesture {
                                                        selectedDay = DF.toDate(str: sd)
                                                    }
                                                }
                                            }
                                            .padding(.horizontal, 12)
                                        }
                                        .frame(maxWidth: .infinity)

                                        HStack {

                                            Text("All")
                                                .padding(.horizontal , 12)
                                                .padding(.vertical , 6)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 4)
                                                        .stroke(Color.mainColor, lineWidth: 2)
                                                }
                                                .foregroundColor(Color.mainColor)

                                            ForEach(s, id:\.vn) { b in
                                                Text(b.vn)
                                                    .padding(.horizontal , 12)
                                                    .padding(.vertical , 6)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 4)
                                                            .stroke(.gray, lineWidth: 2)
                                                    }
                                                    .foregroundColor(.gray)

                                            }

                                        }
                                        .font(.system(size: 12))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal , 24)
                                        .padding(.top, 4)
                                        .padding(.bottom, 8)
//
                                        ForEach(s, id:\.vn) { b in
                                            ForEach(b.sd, id:\.n) { d in // day
                                                if (DF.isSameDay(d: selectedDay, str: d.n)) {
                                                    ForEach(d.c, id:\.ci) { p in // place
                                                        VStack(spacing: 4) {
                                                            VStack {
                                                                HStack {
                                                                    Text(p.cn)
                                                                        .font(.system(size: 12))
                                                                        .fontWeight(.semibold)
                                                                    Spacer()
                                                                    Text(b.vn)
                                                                        .padding(.trailing, 12)
                                                                }
                                                                .font(.system(size: 12))
                                                                .padding(.vertical , 8)
                                                                .padding(.horizontal , 10)
                                                                .background(Color(red: 0.1235707179, green: 0.1580777168, blue: 0.2145400047))
                                                            }

                                                            LazyVGrid( columns: Array(repeating: .init(.fixed(87)), count:4) , spacing: 12) {
                                                                ForEach(p.s , id:\.si) { ts in

                                                                    timesoltBox(timesolt: ts)
                                                                }
                                                            }
                                                            .padding(.trailing, 4)
                                                            .padding(.vertical , 8)
                                                        }
                                                    }
                                                }
                                            }

                                        }
                                    }
                                }
                               
                            
                                    
                                if !session {
                                    VStack {
                                        let id = (m.m.trs.first ?? trsC(id: "13106-2634")).id
                                        let player = AVPlayer(url: URL(string: "https://www.mclcinema.com/Images/Movies/Trailers/M-\(id).mp4")!)
                                        VideoPlayer(player: player)
                                            .frame(height: 200)
                                            .padding(.bottom , 24)

                                        VStack {

                                            HStack(alignment: .top) {
                                                Text("導演")
                                                    .frame(width: 80, alignment: .leading)
                                                    .foregroundColor(.gray)
                                                Text(m.e.md)
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)

                                            HStack(alignment: .top) {
                                                Text("導演")
                                                    .frame(width: 80, alignment: .leading)
                                                    .foregroundColor(.gray)
                                                Text(m.e.mc.replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: ""))
                                            }
                                            .frame(maxWidth: .infinity, maxHeight: 90, alignment: .leading)

                                            HStack(alignment: .top) {
                                                Text("類別")
                                                    .frame(width: 80, alignment: .leading)
                                                    .foregroundColor(.gray)
                                                Text(m.b.mg)
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)

                                            HStack(alignment: .top) {
                                                Text("語言／字幕")
                                                    .frame(width: 80, alignment: .leading)
                                                    .foregroundColor(.gray)
                                                Text("\(m.b.ml)/\(m.b.ms)")
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)


                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)

                                        .font(.system(size: 14))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                       
                                        Text(m.i.replacingOccurrences(of: "<\\w+[^>]*>|<\\/\\w+>", with: "", options: .regularExpression))
                                            .font(.system(size: 14))
                                        .padding(.top)
                                        

                                    }
                                    .padding(24)
                                    .padding(.trailing, 12)
                                }
                                
                                
                                
                            }
                            
                        }
                        .background(Color(red: 0.06042201072, green: 0.08748871833, blue: 0.1385272741))
                        .padding(.top , 24)
                    }
                }
                .onAppear {
                    let url = URL(string: "https://www.mclcinema.com/MCLWebAPI2/GetShowDays.aspx?l=1&t=s&id=\(movieId)")!
                    URLSession.shared.dataTask(with: URLRequest(url: url)) { d , r , e in
    
                        guard let d = d else { return }
                        let s = [SessionD].self
                        sessionInfo = try! JSONDecoder().decode( s , from: d )
                        selectedDay = DF.toDate(str: sessionInfo[0].sd[0].n)
                        
                        for info in sessionInfo {
                            for d in info.sd {
                                if ( !dayAvabile.contains(d.n)) {
                                    dayAvabile.append(d.n)
                                }
                            }
                        }
    
                    }.resume()
                    
                     
                    
                    let url2 = URL(string: "https://www.mclcinema.com/MCLWebAPI2/GetMovieDetails.aspx?l=1&t=s&id=\(movieId)&r=beim")!
                    URLSession.shared.dataTask(with: URLRequest(url: url2)) { d , r , e in
                        
                        guard let d = d else { return }
                        let s = [MovieDetails].self
                        movieDetail = try? JSONDecoder().decode( s , from: d ).first
            
                        
                        
                        
                    }.resume()
                }
                

                Color(red: 0.04416629672, green: 0.0659404695, blue: 0.1134429052)
                    .ignoresSafeArea()
                    .frame(height: 100)
                    .offset(y: -400)
            }
        }
        .navigationTitle("場次")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
        .background(Color(red: 0.06042201072, green: 0.08748871833, blue: 0.1385272741))
    }
    
    
    @ViewBuilder
    func header( _ m : MovieDetails ) -> some View {
        VStack {
            
            Text(m.mn)
                .font(.title)
                .bold()
                .multilineTextAlignment(.leading)
                .frame(maxWidth:.infinity, alignment: .leading)
            
            HStack {
                Group {
                    Text("上映日期")
                    Text(m.b.rd)
                    
                    Text(m.b.mrt)
                    Text("分鐘")
                    
                    Text(m.b.mc)
                    
                }
                .font(.system(size:16))
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .padding(.trailing , 12)

            }
            .padding(.top, 4)
                
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
    
    @ViewBuilder
    func timesoltBox(timesolt : SessionDetail) -> some View {
        VStack {
            
            let strA = timesolt.sn.split(separator: ",")
            
            
            HStack(spacing: 2) {
                Image(systemName:"moon")
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                    .font(.system(size: 12))
                Text(DF.convertTo24HourFormat(time: String(strA[2].split(separator: " ")[0]), amPm: String(strA[2].split(separator: " ")[1])))
                    .fontWeight(.semibold)
                    .font(.system(size: 13))
            }
            .offset(x: -6)
            
            Text("HK\(String(strA[3].split(separator: " ")[1]))")
                .foregroundColor(.gray)
                .font(.system(size: 10))
           
            
        }
        .padding(.horizontal )
        .padding(.vertical , 4)
        .background {
            Rectangle()
                .frame(width: 80 , height: 2)
                .foregroundColor(Color(red: 0.08985369653, green: 0.5725602508, blue: 0.5176422))
                .offset(y: 17.5)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(.gray , lineWidth: 1)
        }
        
    }
}

struct MoiveCheckout_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoiveCheckout(movieId: 13194)
        }
    }
}
