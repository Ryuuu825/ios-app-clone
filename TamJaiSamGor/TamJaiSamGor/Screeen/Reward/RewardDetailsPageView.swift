//
//  RewardDetailsPageView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 12/6/2023.
//

import SwiftUI

struct RewardDetailsPageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    Image("ayanami")
                        .resizable()
                        .frame(height: 400)
                        .clipShape(myRoundedRect(cornerRadius: 64 , corner: [.bottomLeft]))
                    
                    VStack(alignment: .leading , spacing: 12) {
                        HStack {
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
                        
                        
                        Text("[ Points Redeem ] $3 Casg Voucher ( Breakfast ) Mobile Ordering Evclusive)")
                            .bold()
                            .lineLimit(2)
                            .font(.subheadline)
                        
                        
                        Text("150 Points")
                            .foregroundColor(.gold)
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity , alignment: .leading)
                        
                        Text("Valid for 60 days upon redemption")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .font(.footnote)
                            .frame(maxWidth: .infinity , alignment: .leading)
                        
                        Group {
                            Text("Description")
                                .bold()
                                .padding(.bottom , -12 )
                                
                            Text("Redeem a $4 e-cash Voucher ( Breakfast ) for 150 points ")
                                .fontWeight(.light)
                                
                        }
                        .frame(maxWidth:.infinity , alignment: .leading)
                        .font(.subheadline)
                        
                        
                        VStack {
                            Group {
                                Text("How to use")
                                    .bold()
                                    .padding(.bottom , -8 )
                                    
                                VStack(spacing: 24) {
                                    VStack {
                                        Group {
                                            Text("To redeem reward:")
                                            Text("1. Click \"Redeem\" button below")
                                            Text("2. Confirm redemption of coupon")
                                            Text("3. Coupons could be viewed & use at \"My Reward\" upon success full redemption")
                                               
                                        }
                                        .fontWeight(.light)
                                        .frame(maxWidth:.infinity , alignment: .leading)
                                    }
                                    
                                    VStack {
                                        Group {
                                            Text("To redeem reward:")
                                            Text("1. Click \"Redeem\" button below")
                                            Text("2. Confirm redemption of coupon")
                                            Text("3. Coupons could be viewed & use at \"My Reward\" upon success full redemption")
                                               
                                        }
                                        .fontWeight(.light)
                                        .frame(maxWidth:.infinity , alignment: .leading)
                                    }
                                }
                                    
                            }
                            .frame(maxWidth:.infinity , alignment: .leading)
                            .font(.subheadline)
                        }
                        .padding(.top , 24)
                        
                        
                        VStack {
                            Group {
                                Text("Terms & Condition")
                                    .bold()
                                    .padding(.bottom , -8 )
                                    
                                VStack {
                                    ForEach(1..<13) { i in
                                        HStack(alignment: .top) {
                                            Text(i.formatted() + ".")
                                                .frame(width: 20, alignment: .leading)
                                            
                                            Text("Applicable at any proice tajkhdjkfh sfkjhsdf sfjhsdfk sfsdf fsdf before 11 am")
                                        }
                                    }
                                }
                                    
                            }
                            .frame(maxWidth:.infinity , alignment: .leading)
                            .font(.caption)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        }
                        .padding(.top , 24)
                        
                        Spacer(minLength: 90)
                    
                    }
                    .padding()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                
                GeometryReader { proxy in
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.gold)
                            .bold()
                        Text("Redemption is for VIP only. Spend $300 more to become a VIP and enjoy more befits!")
                            .font(.footnote)
                            .lineLimit(2)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .padding(8)
                    .padding(.vertical, 8)
                    .background(Color.secondaryColor)
                    .padding(.top , proxy.size.height - 70)
                    
                }
            }
            .frame(maxWidth: .infinity)
            .navigationBarHidden(true)
            
        }
    }
}

struct RewardDetailsPageView_Previews: PreviewProvider {
    static var previews: some View {
        RewardDetailsPageView()
    }
}
