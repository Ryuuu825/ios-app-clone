//
//  Payment.swift
//  mcl-cinemas
//
//  Created by Ryu on 14/1/2024.
//

import SwiftUI

struct Payment: View {
    @State var secTimeRemain = 59
    @State var minTimeRemain = 9
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var purchaseModel : PurchaseModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    HStack {
                        Image(systemName: "timer")
                            .foregroundColor(Color.mainColor)
                            .font(.title3)

                        Text("\(String(format:"%02d" , minTimeRemain)):\(String(format:"%02d" , secTimeRemain))")
                            .onReceive(timer) { _ in
                                if secTimeRemain > 0 {
                                    secTimeRemain -= 1
                                } else if secTimeRemain <= 0 && minTimeRemain > 0 {
                                    minTimeRemain -= 1
                                    secTimeRemain = 60
                                }
                            }
                    }
                    .frame(maxWidth: .infinity , alignment: .trailing)
                    .padding(.trailing , 32)

                    VStack(spacing: 8) {
                        Text(purchaseModel.movieName)
                            .font(.title)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity , alignment: .leading)

                        Text("2D, 日語（字幕：中文）")
                            .frame(maxWidth: .infinity , alignment: .leading)
                    }

                    VStack(spacing: 24) {
                        HStack {
                            VStack {
                                Text("戲院")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.mainColor)

                                Text("\(purchaseModel.cinemaName)")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                            }
                            .frame(width: 250)

                            VStack {
                                Text("影院")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.mainColor)

                                let stra = purchaseModel.sessionDetail.sn.split(separator: ",")[3].split(separator: " ")
                                Text(String(stra[0]))
                                    .frame(maxWidth: .infinity , alignment: .leading)
                            }

                        }


                        HStack {
                            VStack {
                                Text("日期")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.mainColor)
         
                                let stra = purchaseModel.sessionDetail.sn.split(separator: ",")
                                Text("\(String(stra[0])),\(String(stra[1]))\(String(stra[2]))")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                            }
                            .frame(width: 250)

                            VStack {
                                Text("座位")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.mainColor)
                                
                                HStack {
                                    ForEach(purchaseModel.selectedSeat, id:\.hashValue) { i in
                                        Text(i)
                                            
                                    }
                                }.frame(maxWidth: .infinity , alignment: .leading)

                            }

                        }
                    }
                    .padding(.vertical , 28)
                    .font(.system(size: 18))

                    VStack(spacing: 8) {
                        HStack {
                            Text("項目")
                                .frame(width: 170, alignment: .leading)


                            Text("敷量")
                                .frame(width: 70, alignment: .center)

                            Text("售價")
                                .frame(width: 90, alignment: .center)
                        }
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .fontWeight(.medium)

                        Text("戲票類別")
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .foregroundColor(Color.mainColor)
                            .fontWeight(.medium)

                        ForEach(purchaseModel.priceList, id:\.n) { price in
                            if price.count > 0 {
                                HStack {
                                    Text(price.n)
                                        .frame(width: 170, alignment: .leading)


                                    Text(String(price.count))
                                        .frame(width: 70, alignment: .center)
                                    
                                    Text("$\(String( Int(price.p)! * price.count )).00")
                                        .frame(width: 90, alignment: .center)
                                }

                            }
                        }
                        
                        Text("手續費")
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .foregroundColor(Color.mainColor)
                            .fontWeight(.medium)

                        HStack {
                            Text("$10 手續費")
                                .frame(width: 170, alignment: .leading)


                            Text(String(purchaseModel.totalTicketBuy))
                                .frame(width: 70, alignment: .center)
                            Text("$\(purchaseModel.totalTax).00")
                                .frame(width: 90, alignment: .center)
                        }

                        Text("其他購買")
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .foregroundColor(Color.mainColor)
                            .fontWeight(.medium)

                        HStack {
                            Text("--")
                                .frame(width: 170, alignment: .leading)


                            Group {
                                Text("1")
                                    .frame(width: 70, alignment: .center)
                                Text("$45.00")
                                    .frame(width: 90, alignment: .center)
                            }
                            .hidden()
                        }

                        HStack {
                            Text("金額總和")
                                .foregroundColor(Color.mainColor)
                                .fontWeight(.medium)
                                .font(.system(size:22))

                            Spacer()

                            Text("$\(purchaseModel.totalPriceIncludedTax).00")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size:22))
                        }

                    }
                    .font(.system(size: 18))

                    VStack {
                        Text("條款及細則")
                            .fontWeight(.semibold)

                        Text("凡於MCL手機應用程式訂票，須每票支付HK$10手續費；在任何情況下，手續費將不設退回。請小心核對上列訂票資料，當您確認付款後，交易便不能取消，而所售之戲票及小食將不能更換或退款。")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.7, green:0.7, blue: 0.7))
                    }
                    .padding(.top , 32)

                    VStack(spacing: 12) {
                        Text("恒生MPOWER卡網上購票免手續費優惠")
                            .foregroundColor(.mainColor)
                            .fontWeight(.medium)

                        Text("""
憑恒生MPOWER卡於MCL戲院網站或手機應用程式預訂任何戲票可獲豁免手續費。每項交易可享最多4張戲票之免手續費優惠。
優惠每月設有10,000個名額限制，先到先得，額滿即止。
請即上 hangseng.com/mpower 登記，以獲取優惠代碼！優惠須受有關條款及細則約束，詳情請瀏覽恒生或MCL網站。
""")
                        .multilineTextAlignment(.center)
                        .fontWeight(.medium)

                        Text("恒生MPOWER卡購票免手續費優惠不適用於所有使用電子禮券之交易。")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.7, green:0.7, blue: 0.7))
                    }
                    .padding(.vertical, 32)

                    VStack {
                        Text("優惠代碼")
                            .foregroundColor(Color.mainColor)

                        Text("如有優惠代碼，請於下方空格輸入，然後按使用。")

                        HStack {
                            RoundedRectangle(cornerRadius: 32)
                                .frame(width: 256, height: 48)
                                .foregroundColor(Color.cbgColor2)

                            Text("使用")
                                .frame(width: 78, height: 48)
                                .background {
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundColor(Color.mainColor)
                                }

                        }
                    }
                    
                    HStack {
                        Image("visal")
                            .resizable()
                            .scaledToFit()
                            .frame( width: 128 , height: 128)
                        
                        Image("masterl")
                            .resizable()
                            .scaledToFit()
                            .frame( width: 128 , height: 128)
                    }
//
                    VStack(spacing: 18) {
                        TextField("卡主姓名", text: .constant(""))
                            .padding()
                            .frame(height: 48)
                            .background {
                                RoundedRectangle(cornerRadius: 32)
                                    .foregroundColor(Color.cbgColor2)
                            }
                        
                        HStack {
                            TextField("信用卡號碼", text: .constant(""))
                                .padding()
                                .frame(width: 256 , height: 48)
                                .background {
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundColor(Color.cbgColor2)
                                }
                            
                            Spacer()
                        }
                        
                        VStack {
                            Text("有效日期 (MM/YYYY)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.gray)
                            
                            HStack {
                                Picker(selection: .constant(1), label: Text("")) {
                                    ForEach(1..<13, id:\.hashValue) { i in
                                        Text(i.description)
                                            .tag(i)
                                    }
                                }
                                .frame(width: 152 , height: 48)
                                .background {
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundColor(Color.cbgColor2)
                                }
                                .accentColor(.white)
                                
                                Spacer()
                                
                                Rectangle()
                                    .frame(width: 1.5, height: 20)
                                    .rotationEffect(.degrees(20))
                                
                                Spacer()
                                
                                Picker(selection: .constant(2024), label: Text("")) {
                                    ForEach(2024..<2050, id:\.hashValue) { i in
                                        Text(i.description)
                                            .tag(i)
                                    }
                                }
                                .frame(width: 172 , height: 48)
                                .background {
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundColor(Color.cbgColor2)
                                }
                                .accentColor(.white)
                                
                            }
                        }
                        HStack {
                           
                            TextField("CVV", text: .constant(""))
                                .padding()
                                .frame(width: 128 , height: 48)
                                .background {
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundColor(Color.cbgColor2)
                                }
                            
                            Text("什麼是CVV?")
                                .foregroundColor(.gray)
                                .underline()
                            
                            Spacer()
                                
                        }
                        
                        VStack(alignment: .leading) {
                            Text("接收短訊")
                            
                            Text("手提電話號碼")
                                .foregroundColor(.gray)
                            
                            TextField("12345678", text: .constant(""))
                                .padding()
                                .frame(width: 200 , height: 48)
                                .background {
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundColor(Color.cbgColor2)
                                }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading )
                        
                        VStack(alignment: .leading) {
                            Text("接收雷郵")
                            
                            Text("請輸入雷郵地址")
                                .foregroundColor(.gray)
                            
                            TextField("電郵(可選填）", text: .constant(""))
                                .padding()
                                .frame( height: 48)
                                .background {
                                    RoundedRectangle(cornerRadius: 32)
                                        .foregroundColor(Color.cbgColor2)
                                }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading )
                        
                        VStack {
                            Text("* 若登入會員購買項目，收取「訂單QR code」 的電話號碼必須為閣下會籍綁定的手提電話號碼。會籍綁定電話號碼後在任何情況下不能更改。")
                                .foregroundColor(.red)
                            Text("*所有資料將會保密及只作領取購買項目用途。")
                            Text("*每個 QR Code 只能使用 1次，請勿任意分享給他人以避免糾紛。")
                        }
                        
                        VStack {
                            Text("個人資料收集聲明")
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .underline()
                                .padding(.vertical , 8)
                            
                            Text("""
當你於MCL網上或手機應用程式購買戲票或其他付款服務時,本公司需要你提供你的個人資料,用以處理閣下的交易要求。有關的個人資料收集只會應用於購買戲票或其他付款服務及與票務查詢的用途。如欲了解「個人資料收集」聲明之詳情，請按此。
""")
                            .foregroundColor(.gray)
                            
                            Text("當你按下「付款」即表示閣下明白「個人資料收集」聲明及進行有關交易。")
                                .foregroundColor(.gray)
                                .padding(.top , 12)
                        }
                        
                        VStack {
                            Text("私隱政策聲明")
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .underline()
                                .padding(.vertical , 8)
                            
                            Text("我們承諾依從《個人資料(私隱）條例》的相關條件。如欲查閱有關聲明的詳細內容，如欲了解私隱政策聲明之詳情，請按此。")
                            .foregroundColor(.gray)
   
                        }
                        
                        NavigationLink {
                            FinishPurchase(purchaseModel: purchaseModel)
                        } label: {
                            Text("付款 $\(purchaseModel.totalPriceIncludedTax).00")
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
                    
                    Spacer()
                }
                .padding(.horizontal, 12)
                
                
            }
            .background {
                Color.bgColor
                    .ignoresSafeArea()
            }
            
        }
        .preferredColorScheme(.dark)
        .navigationTitle("賺票")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Payment(purchaseModel: .init(sessionDetail: .init(si: 62999, sn: "星期二, 1月16日, 04:00 PM, 3院 $65", r: 92), cinemaName: "K11 ART HOUSE (尖東站)", cinemaId: "017", priceList: [.init(n: "學生", p: "100", count: 3), .init(n: "會員9折", p: "100", count: 0)] , selectedSeat: ["F4" , "H4"]))
        }
    }
}
