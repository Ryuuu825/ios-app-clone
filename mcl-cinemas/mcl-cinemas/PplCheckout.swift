//
//  PplCheckout.swift
//  mcl-cinemas
//
//  Created by Ryu on 9/1/2024.
//

import SwiftUI


//struct PurchaseModel {
////sessionDetail: .init(si: 12345, sn: "星期二, 1月16日, 04:00 PM, 3院 $65", r: 92), cinema: "K11 ART HOUSE (尖東站)"
//    var sessionDetail : SessionDetail
//    var cinemaName : String
//    var cinemaId : String



struct Price : Codable {
    
    var n : String
    var p : String
    var count : Int = 0
    
    enum CodingKeys : CodingKey {
        case n
        case p
    }
}


struct PplCheckout: View {
    
    let movieId : String
    
    @State var movieDetail : MovieDetails? = nil
    @State var purchase : PurchaseModel 
    
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack {
                    AsyncImage(url: URL(string: "https://www.mclcinema.com/Images/Movies/V-\(movieId).jpg" )) { image in
                        image
                            .resizable()
                            .frame(width: 600, height: 700 )
                            .scaledToFill()
                            .grayscale(1)
                        
                    } placeholder: {
                        
                    }
                    .frame(width: 300, height: 700 )
                    .offset(y: -100)
                    .opacity(0.6)
                    
                    LinearGradient(colors: [.black.opacity(0.1) , Color.bgColor.opacity(0.99)], startPoint: .top, endPoint: .center)
                        .frame(height: 300)
                        .offset(y: -270)
                        

                    Color.bgColor
                        .offset(y: 150)
                }
                
                
                VStack {
                    VStack {
                        if movieDetail != nil {
                            let m = movieDetail!
                            
                            VStack {
                                
                                VStack(spacing: 2) {
                                    Text(m.mn)
                                        .font(.title)
                                        .bold()
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth:.infinity, alignment: .leading)

                                    
                                    Text("2024年\(String(purchase.sessionDetail.sn.split(separator: ",")[1])) \(String(purchase.sessionDetail.sn.split(separator: ",")[2])) 2D")
                                        .font(.system(size:16))
                                        .padding(.top, 4)
                                        .frame(maxWidth: .infinity , alignment: .leading)
                                    
                                }
                                
                                
                            }
                            .padding(.horizontal, 24)
                            .padding(.bottom, 8)
                            
                            
                            VStack {
                                Text("折扣類別")
                                    .foregroundColor(Color.mainColor)
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .padding(.bottom, 8)
                                
                                Text("閣下必須輸入合資格信用卡號碼或優惠碼方可使用指定優惠")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(Color(red: 0.8 , green: 0.8 , blue: 0.8))
                                
                                Text("信用卡號碼(首 8位數字)或優惠碼")
                                    .foregroundColor(.gray)
                                    .padding(.leading, 24)
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .frame(height: 50)
                                    .background {
                                        RoundedRectangle(cornerRadius: .infinity)
                                            .foregroundColor(Color.cbgColor2)
                                    }
                                
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color.cbgColor2)
                                    .padding(.top, 24)
                                
                            }
                            .padding(.horizontal , 24)
                            .padding(.top , 28)
                            .font(.system(size:14))
                            
                            VStack {
                                Text("戲票")
                                    .font(.system(size: 14))
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.gray)
                                
                                VStack {
     
                                    VStack {
                                        ForEach(0..<purchase.priceList.count, id:\.hashValue) { idx in
                                            let p = purchase.priceList[idx]
                                            
                                            HStack {
                                                VStack {
                                                    Text("\(p.n) ($\(p.p))")
                                                        .frame(maxWidth: .infinity , alignment: .leading)
        
                                                    Text("$\(p.p)")
                                                        .foregroundColor(Color.mainColor)
                                                        .frame(maxWidth: .infinity , alignment: .leading)
                                                }
                                                
                                                Spacer()
                                                
                                                Image(systemName: "minus")
                                                    .font(.system(size: 12))
                                                    .frame(width: 20 , height: 20)
                                                    .background {
                                                        Color.gray
                                                    }
                                                    .foregroundColor(.black)
                                                    .cornerRadius(.infinity)
                                                    .opacity(purchase.priceList[idx].count > 0 ? 1 : 0.3)
                                                    .onTapGesture {
                                                        if purchase.priceList[idx].count > 0 {
                                                            purchase.priceList[idx].count-=1
                                                        }
                                                    }
                                                
                                                Text(purchase.priceList[idx].count.description)
                                                
                                                Image(systemName: "plus")
                                                    .font(.system(size: 12))
                                                    .frame(width: 20 , height: 20)
                                                    .background {
                                                        Color.gray
                                                    }
                                                    .foregroundColor(.black)
                                                    .cornerRadius(.infinity)
                                                    .onTapGesture {
                                                        purchase.priceList[idx].count+=1
                                                    }
                                            }
                                        }
                                    }
                                }
                                
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color.cbgColor2)
                                
                            }
                            .padding(.horizontal , 24)
                            
                            VStack(spacing: 12) {
                                Text("使用電子禮券")
                                    .font(.system(size: 14))
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.gray)
                                
                                Text("對不起，電子禮券不適用於此場次之電影")
                                    .font(.system(size: 13))
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                
                                HStack {
                                    Text("金額：")
                                    
                                    Spacer()
                                    
                                    Text("$\(calTotalPrice(purchase: purchase))")
                                }
                                .font(.system(size: 22))
                                .bold()
                                
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color.cbgColor2)
                            
                            }
                            .padding(.horizontal , 24)
                            .padding(.top , 12)
                            
                            
                            HStack {
                                Text("條款及細則")
                                
                                Image(systemName:"chevron.down")
                                    
                            }
                            .padding(.horizontal , 24)
                            .padding(.top , 12)
                            .foregroundColor(Color.mainColor)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            
                            Spacer()
                                
                            NavigationLink {
                                SelectSeat(movieId: movieId, purchaseModel: purchase)
                            } label: {
                                Text("下一步")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background {
                                        LinearGradient(colors:[Color.mainColor , Color.secColor] , startPoint: .leading, endPoint: .trailing)
                                    }
                                    .cornerRadius(.infinity)
                                    .padding()
                            }
                            .accentColor(.white)
                            .disabled(purchase.totalTicketBuy <= 0)
                            

                        }
                        
                    }
                    .onAppear {
                        let url2 = URL(string: "https://www.mclcinema.com/MCLWebAPI2/GetMovieDetails.aspx?l=1&t=s&id=\(movieId)&r=beim")!
                        URLSession.shared.dataTask(with: URLRequest(url: url2)) { d , r , e in
                            
                            guard let d = d else { return }
                            let s = [MovieDetails].self
                            movieDetail = try? JSONDecoder().decode( s , from: d ).first
                            
                            
                        }.resume()
                        
                        let url = URL(string: "https://www.mclcinema.com/MCLWebAPI2/GetPrice.aspx?l=1&si=\(purchase.sessionDetail.si)&ci=\(purchase.cinemaId)")!
                        
                        print("https://www.mclcinema.com/MCLWebAPI2/GetPrice.aspx?l=1&si=\(purchase.sessionDetail.si)&ci=\(purchase.cinemaId)")
                        URLSession.shared.dataTask(with: URLRequest(url: url)) { d , r , e in

                            guard let d = d else { return }
                            let s = [Price].self
                            purchase.priceList = try! JSONDecoder().decode(s , from: d)



                        }.resume()
                        
                    }
                    
                    
                   
                }
                
                

            }
            
        }
        .preferredColorScheme(.dark)
        .navigationTitle("賺票")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension PplCheckout {
    func calTotalPrice(purchase : PurchaseModel) -> Int {
        let priceList = purchase.priceList
        var totalPrice = 0
        for p in priceList {
            totalPrice += p.count * (Int(p.p) ?? 0)
        }
        
        return totalPrice
    }
}

struct PplCheckout_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // 12457
            PplCheckout(movieId: "12885", purchase: .init(sessionDetail: .init(si: 62999, sn: "星期二, 1月16日, 04:00 PM, 3院 $65", r: 92), cinemaName: "K11 ART HOUSE (尖東站)", cinemaId: "017"))
        }
    }
}
