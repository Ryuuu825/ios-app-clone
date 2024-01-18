//
//  SeatingPlan.swift
//  mcl-cinemas
//
//  Created by Ryu on 29/12/2023.
//

import SwiftUI


struct HtmlText : UIViewRepresentable {
    let htmlStr : String
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<Self>) {
        DispatchQueue.main.async {
            let data = Data(self.htmlStr.utf8)
            if let attString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                uiView.isEditable = false
                uiView.attributedText = attString
                
            }
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<Self> ) -> UITextView {
        let label = UITextView()
        return label
    }
}


struct PurchaseModel {
//sessionDetail: .init(si: 12345, sn: "星期二, 1月16日, 04:00 PM, 3院 $65", r: 92), cinema: "K11 ART HOUSE (尖東站)"
    var movieName : String = "The first slam dunk 日語版"
    var sessionDetail : SessionDetail
    var cinemaName : String
    var cinemaId : String
    var priceList : [Price] = []
    var selectedSeat : [String] = []
    
    var totalTicketBuy : Int {
        var total = 0
        for p in priceList {
            total += p.count
        }
        return total
    }
    
    var totalTax : Int {
        return 10 * totalTicketBuy
    }
     
    var totalPriceIncludedTax : Int {
        var total = 0
        for p in priceList {
            total += p.count * Int(p.p)!
        }
        return total + totalTax
    }
}

struct SeatingPlan: View {
    
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
                            .frame(width: 400, height: 700 )
                            .scaledToFit()
                            .grayscale(1)
                    } placeholder: {
                        
                    }
                    .offset(y: -100)
                    .opacity(0.6)
                    
                    LinearGradient(colors: [.black.opacity(0.1) , Color.bgColor.opacity(0.99)], startPoint: .top, endPoint: .center)
                        .frame(height: 300)
                        .offset(y: -270)
                        

                    Color.bgColor
                        .offset(y: 150)
                }
                
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
                                
                                HStack {
                                    Group {
                                        Text(purchase.cinemaName)
                                        
                                        Text(m.b.mrt)
                                        Text("分鐘")
                                        
                                        Text(m.b.mc)
                                        
                                    }
                                    .font(.system(size:13))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "info.circle")
                                        .padding(.trailing , 12)
                                    
                                }
                                .padding(.top, 4)
                                
                                HStack {
                                    Color(red: 0.08985369653, green: 0.5725602508, blue: 0.5176422)
                                        .frame(width: 3, height: 40)
                                    
                                    VStack(alignment: .leading) {
                                        let isToday = DF.isSameDay(d: Date.now, str: String(purchase.sessionDetail.sn.split(separator: ",")[1]), dateFor: "mm月dd日")
                                        let weekStr = isToday ? "即日" : String(purchase.sessionDetail.sn.split(separator: ",")[0])
                                        Text("\(String(purchase.sessionDetail.sn.split(separator: ",")[1]))（\(weekStr)）, \(String(purchase.sessionDetail.sn.split(separator: ",")[2]))")
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                        
                                        let ws = String(purchase.sessionDetail.sn.split(separator: ",")[3]).split(separator: " ")[0]
                                        Text("\(String(ws)), 2D 全景聲")
                                            .font(.system(size: 12))
                                    }
                                    
                                    
                                    Spacer()
                                    
//                                    Image(systemName: "chevron.down")
//                                        .padding(.trailing , 12)
//                                        .foregroundColor(.gray)
                                    
                                    
                                }
                                .frame(maxWidth: .infinity)
                                .padding(5)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.gray , lineWidth: 1)
                                }
                                .padding(.horizontal)
                                .padding(.top, 12)
                                
                                Text("只供預覽")
                                    .foregroundColor(.mainColor)
                                    .font(.system(size: 13))
                                    .fontWeight(.medium)
                                    .padding(.top, 4)
                            }
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                        
                        
                        VStack {
                            Text("銀幕")
                                .foregroundColor(.mainColor)
                                .font(.system(size: 13))
                                .fontWeight(.medium)
                                .padding(.top, 4)
                            
                            ZStack {
                                Path { path in
                                    path.move(to: CGPoint(x: 25 , y: 15))
                                    path.addQuadCurve(to:CGPoint(x: 375 , y: 15) , control: CGPoint(x: 200 , y: 0))
                                }
                                .stroke(Color.mainColor, lineWidth: 1)
                                .frame(height: 15)
                                
                                
                                Path { path in
                                    path.move(to: CGPoint(x: 25 , y: 15))
                                    path.addQuadCurve(to:CGPoint(x: 375 , y: 15) , control: CGPoint(x: 200 , y: -2))
                                }
                                .stroke(Color.secColor , lineWidth: 1)
                                .frame(height: 15)
                                
                            }
                            .padding(.bottom, 12)
                            
                            fakeSeatingPlan()
                            
                            Spacer()
                            
                        }
                        
                        
                        Spacer()
                        
                        
                        VStack {
                            Rectangle()
                                .frame(width: .infinity , height: 1)
                                .padding(.horizontal , 32)
                                .foregroundColor(.gray)
                            
                            HStack {
                                HStack(spacing: 12) {
                                    
                                    Text("2")
                                        .font(.system(size:12))
                                        .frame(width: 20 , height: 20)
                                        .foregroundColor(.gray)
                                        .fontWeight(.medium)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(red: 0.3707997799, green: 0.4359932542, blue: 0.5341949463), lineWidth: 1)
                                        }
                                    
                                    Text("可選")
                                        .font(.system(size:12))
                                        .frame(width: 75, alignment: .leading)
                                    
                                    
                                }
                                .frame(width: 120)
                                
                                HStack(spacing: 12) {
                                    Text("")
                                        .frame(width: 20 , height: 20)
                                        .background {
                                            Color(red: 0.3707997799, green: 0.4359932542, blue: 0.5341949463)
                                        }
                                        .cornerRadius(8)
                                    
                                    Text("已售")
                                        .font(.system(size: 12))
                                        .frame(width: 75, alignment: .leading)
                                    
                                }
                                .frame(width: 120)
                                
                                HStack(spacing: 12) {
                                    Text("4")
                                        .font(.system(size:10))
                                        .frame(width: 20 , height: 20)
                                        .foregroundColor(.white)
                                        .fontWeight(.medium)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(red: 0.3707997799, green: 0.4359932542, blue: 0.5341949463), lineWidth: 1)
                                        }
                                        .background {
                                            Path { path in
                                                path.move(to: CGPoint(x: 2, y: 3))
                                                path.addQuadCurve(to: CGPoint(x: 7, y: 3), control: CGPoint(x: 5, y: 6))
                                                path.addQuadCurve(to: CGPoint(x: 13, y: 3), control: CGPoint(x: ((13+7)/2), y: 6))
                                                path.addQuadCurve(to: CGPoint(x: 18, y: 3), control: CGPoint(x: ((13+18)/2), y: 6))
                                                
                                            }
                                            .stroke(.white, lineWidth: 1)
                                            
                                            Path { path in
                                                path.move(to: CGPoint(x: 2, y: 16))
                                                path.addQuadCurve(to: CGPoint(x: 7, y: 16), control: CGPoint(x: 5, y: 14))
                                                path.addQuadCurve(to: CGPoint(x: 13, y: 16), control: CGPoint(x: ((13+7)/2), y: 14))
                                                path.addQuadCurve(to: CGPoint(x: 18, y: 16), control: CGPoint(x: ((13+18)/2), y: 14))
                                                
                                            }
                                            .stroke(.white, lineWidth: 1)
                                            
                                        }
                                    
                                    Text("震動座位")
                                        .font(.system(size: 12))
                                        .frame(width: 75, alignment: .leading)
                                    
                                }
                                .frame(width: 120)
                            }
                            .font(.system(size: 14))
                            .frame(width: .infinity)
                            
                            HStack {
                                HStack(spacing: 12) {
                                    
                                    Image(systemName: "xmark")
                                        .frame(width: 20 , height: 20)
                                        .foregroundColor(.gray)
                                        .fontWeight(.medium)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(red: 0.3707997799, green: 0.4359932542, blue: 0.5341949463), lineWidth: 1)
                                        }
                                    
                                    Text("不可選")
                                        .frame(width: 75, alignment: .leading)
                                    
                                    
                                }
                                .frame(width: 120)
                                
                                
                                HStack(spacing: 12) {
                                    Image(systemName: "figure.roll")
                                        .rotationEffect(Angle(degrees: -20))
                                        .frame(width: 20 , height: 20)
                                        .foregroundColor(.white)
                                        .fontWeight(.medium)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(red: 0.3707997799, green: 0.4359932542, blue: 0.5341949463), lineWidth: 1)
                                        }
                                    
                                    Text("輪椅位\n(只供輪椅人士使用）")
                                        .font(.system(size: 12))
                                        .frame(width: 72)
                                    
                                }
                                .frame(width: 120)
                                
                                HStack(spacing: 12) {
                                    
                                    HStack {
                                        HStack {
                                            Text("5")
                                            Text("6")
                                        }
                                        .frame(width: 50 , height: 20)
                                        .foregroundColor(.gray)
                                        .fontWeight(.medium)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(red: 0.3707997799, green: 0.4359932542, blue: 0.5341949463), lineWidth: 1)
                                        }
                                    }
                                    .frame(width: 55 , height: 25)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 0.3707997799, green: 0.4359932542, blue: 0.5341949463), lineWidth: 1)
                                    }
                                    
                                    Text("雙人座")
                                        .frame(width: 50, alignment: .leading)
                                    
                                    
                                }
                                .frame(width: 120)
                            }
                            .font(.system(size: 14))
                            .frame(width: .infinity)
                        }
                        
                            
                        NavigationLink(destination:
                            PplCheckout(movieId: movieId, purchase: purchase)
                        ) {
                            Text("會員")
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background {
                                    LinearGradient(colors:[Color.mainColor , Color.secColor] , startPoint: .leading, endPoint: .trailing)
                                }
                                .cornerRadius(.infinity)
                                .padding()
                        }
                        .accentColor(.white)
                    }
                    
                }
                .onAppear {
                    let url2 = URL(string: "https://www.mclcinema.com/MCLWebAPI2/GetMovieDetails.aspx?l=1&t=s&id=\(movieId)&r=beim")!
                    URLSession.shared.dataTask(with: URLRequest(url: url2)) { d , r , e in
                        
                        guard let d = d else { return }
                        let s = [MovieDetails].self
                        movieDetail = try? JSONDecoder().decode( s , from: d ).first
                        
                        purchase.movieName = movieDetail?.mn ?? ""
                        
                        
                        
                    }.resume()
                }

            }
            
        }
        .preferredColorScheme(.dark)
        .navigationTitle("賺票")
        .navigationBarTitleDisplayMode(.inline)
    }
    

}


extension SeatingPlan {
    
    @ViewBuilder
    func fakeSeatingPlan() -> some View {
        VStack(spacing:3) {
           
            HStack {
                Text("A")
                    .font(.system(size: 10))
                    .frame(width: 15)
        
                Spacer()
                
                HStack(spacing: 4) {
                    ForEach(17..<19 , id:\.hashValue) { i in
                        Text((19+17 - i).description)
                            .numberBox()
                    }
                    .hidden()
                    
                    ForEach(13..<17 , id:\.hashValue) { i in
                        Image(systemName: "figure.roll")
                            .rotationEffect(Angle(degrees: -20))
                            .numberBox()
                    }
                    
                    ForEach(8..<13 , id:\.hashValue) { i in
                        Text((13+8 - i).description)
                            .numberBox()
                    }
                    
                }
                
                HStack(spacing: 4) {
                    ForEach(3..<7 , id:\.hashValue) { i in
                        Text((7+4 - i).description)
                            .numberBox()
                    }
                }
                .padding(.leading, 32)
                .hidden()
                
                
                Spacer()
                
                Text("A")
                    .font(.system(size: 10))
                    .frame(width: 15)
            }
            
            ForEach(1..<13, id:\.hashValue) { i in
                HStack {
                    
                    Text(String(UnicodeScalar(UInt8(65 + i))))
                        .font(.system(size: 10))
                        .frame(width: 15)
            
                    Spacer()
                    
                    HStack(spacing: 4) {
                        ForEach(8..<19 , id:\.hashValue) { i in
                            Text((19+8 - i).description)
                                .numberBox()
                        }
                    }
                   
                    
                    HStack(spacing: 4) {
                        ForEach(3..<7 , id:\.hashValue) { i in
                            Text((7+4 - i).description)
                                .numberBox()
                        }
                    }
                    .padding(.leading, 32)
                   
                    
                    Spacer()
                    
                    Text(String(UnicodeScalar(UInt8(65 + i))))
                        .font(.system(size: 10))
                        .frame(width: 15)
                    
                }
                
            }
        }
        .padding(.horizontal , 12)
        
    }
}

extension View {
    func numberBox() -> some View {
        font(.system(size: 8))
        .frame(width: 14 , height: 14)
        .foregroundColor(.white)
        .fontWeight(.medium)
        .overlay {
            RoundedRectangle(cornerRadius: 2)
                .stroke(.gray, lineWidth: 0.5)
        }
    }
}

struct SeatingPlan_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SeatingPlan(movieId: "13295", purchase : .init(sessionDetail: .init(si: 12345, sn: "星期二, 1月16日, 04:00 PM, 3院 $65", r: 92), cinemaName: "K11 ART HOUSE (尖東站)", cinemaId: "017"))
        }
    }
}
