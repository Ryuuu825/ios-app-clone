//
//  RewardRedmptionPageView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 12/6/2023.
//

import SwiftUI

struct myRoundedRect : Shape {
    
    var cornerRadius : Double = .infinity
    var corner : UIRectCorner = .allCorners
    
    func path( in rect : CGRect ) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct RewardRedmptionPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    
                    GeometryReader { proxy in
                        Text("Reward Redemption")
                            .bold()
                            .font(.title3)
                            .frame(maxWidth: .infinity , alignment: .center)
                        
                        HStack(spacing: 24) {
                            Image(systemName: "qrcode.viewfinder" )
                            Text("%")
                        }
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity , alignment: .trailing)
                        
                    }
     
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, maxHeight:  70)
                .background(  myRoundedRect(cornerRadius: 24 , corner: [.bottomLeft]).foregroundColor(.mainColor).ignoresSafeArea() )
                
                ScrollView {
                    VStack {
                        Text("Coupons ( Mobile Ordering Exclusive )")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding()
                            .font(.title3)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.gold)
                                .bold()
                            Text("Redemption is for VIP only. Spend $300 more to become a VIP and enjoy more befits!")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .padding(.vertical, 8)
                        .background(Color.secondaryColor)
                        .cornerRadius(12)
                        .padding()
                        
                        
                        ForEach(1..<12) { _ in
                            NavigationLink(destination: RewardDetailsPageView()) {
                                HStack {
                                    Image("ayanami")
                                        .resizable()
                                        .frame(width: 90 , height: 90)
                                        .cornerRadius(12)
                                    
                                    VStack {
                                        Text("[ Points Redeem ] $3 Casg Voucher ( Breakfast ) Mobile Ordering Evclusive)")
                                            .bold()
                                            .lineLimit(2)
                                            .font(.subheadline)
                                        
                                        HStack{
                                            Group {
                                                Text("Dine-in")
                                                   
                                                Text("Dine-in")
                                                    
                                            }
                                            .font(.footnote)
                                            .padding(.horizontal, 4)
                                            .padding(.vertical, 2)
                                            .background(Color(UIColor.secondarySystemBackground))
                                            .foregroundColor(Color(UIColor.secondaryLabel))
                                        }
                                        .frame(maxWidth: .infinity , alignment: .leading)
                                        
                                        Text("150 Points")
                                            .foregroundColor(.gold)
                                            .bold()
                                            .font(.headline)
                                            .frame(maxWidth: .infinity , alignment: .leading)
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 16)
                                .background(Color.white)
                                .cornerRadius(12)
                                .padding(.horizontal)
                                .foregroundColor(Color.black)
                            }
                        }
                    }
                }
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

struct RewardRedmptionPageView_Previews: PreviewProvider {
    static var previews: some View {
        RewardRedmptionPageView()
    }
}
