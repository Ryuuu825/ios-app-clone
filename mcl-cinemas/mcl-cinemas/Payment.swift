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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    HStack {
                        Image(systemName: "timer")
                            .foregroundColor(Color.mainColor)
                            .font(.title3)
                        
                        Text("\(minTimeRemain):\(secTimeRemain)")
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
                        Text("青春豬頭少年不會夢到紅書包女孩")
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
                                
                                Text("康怡戲院（太古站）")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                            }
                            .frame(width: 250)
                            
                            VStack {
                                Text("影院")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.mainColor)
                                
                                Text("5院")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                            }

                        }
                        
                        
                        HStack {
                            VStack {
                                Text("日期")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.mainColor)
                                
                                Text("星期日，1月14日下午08:05")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                            }
                            .frame(width: 250)
                            
                            VStack {
                                Text("座位")
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .foregroundColor(.mainColor)
                                
                                Text("F4")
                                    .frame(maxWidth: .infinity , alignment: .leading)
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
                        
                        HStack {
                            Text("學生")
                                .frame(width: 170, alignment: .leading)
                                
                            
                            Text("1")
                                .frame(width: 70, alignment: .center)
                            Text("$45.00")
                                .frame(width: 90, alignment: .center)
                        }
                        
                        Text("手續費")
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .foregroundColor(Color.mainColor)
                            .fontWeight(.medium)
                        
                        HStack {
                            Text("$10 手續費")
                                .frame(width: 170, alignment: .leading)
                                
                            
                            Text("1")
                                .frame(width: 70, alignment: .center)
                            Text("$45.00")
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
                            
                            Text("$55.00")
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
                    
                    Text("恒生MPOWER卡網上購票免手續費優惠")
                    
                    Spacer()
                }
                .padding(.horizontal, 32)
                
                
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
            Payment()
        }
    }
}
