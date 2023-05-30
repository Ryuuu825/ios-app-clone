//
//  OrderRecordsPage.swift
//  CallCFu
//
//  Created by Ryu on 29/5/2023.
//

import SwiftUI

enum OrderRecordsPagesTab : String , View , CaseIterable{
    case posting = "張貼中", inaction = "進行中" , records = "紀錄"
    
    var body: some View {
        switch self {
            case .posting: Text("系統正在為您配對師傅，柯打張貼期為72小時，閣下的聯絡資料只提供給有興趣報價的1-5位師傅").lineLimit(2...3)
            case .inaction: Text("柯打已完成張貼程序，正在聯絡商議或安排工作中。")
            case .records: Text("柯打已經完工、被取消或末能配對，有關記錄將保存180日。").lineLimit(2...3)
        }
    }
}

extension View {
    func textBox( width : CGFloat ) -> some View {
        multilineTextAlignment(.leading)
        .font(.system(size: 15))
        .foregroundColor(Color(red: 0.3371666074, green: 0.5451127887, blue: 0.9058645964))
        .fontWeight(.semibold)
        .padding(.horizontal , 10)
        .padding(.vertical , 5 )
        .frame(width: width , alignment: .leading )
        .border(Color.blue)
        .background(Color(red: 0.8901842237, green: 0.9411795735, blue: 0.9960741401))
        .padding(.horizontal , 10)
    }
}

struct OrderRecordsPage: View {
    
    @State var tab : OrderRecordsPagesTab = .posting

    
    var body: some View {
        MyNavigationView(title: "柯打紀錄" , bgColor: Color(red: 0.9176469445, green: 0.9137256742, blue: 0.9372537136) ) {
            GeometryReader { proxy in
                VStack {
                    
                   
                    HStack {
                        
                        Button {
                            tab = .posting
                        } label: {
                            Spacer()
                            Text("張貼中")
                            Spacer()
                        }
                        .frame(height: 40)
                        .foregroundColor(tab == .posting ? Color.white : Color.blue)
                        .background(tab == .posting ? Color.blue : Color.clear)
                        
                        Button {
                            tab = .inaction
                        } label: {
                            Spacer()
                            Text("進行中")
                            Spacer()
                        }
                        .frame(height: 40)
                        .foregroundColor(tab == .inaction ? Color.white : Color.blue)
                        .background(tab == .inaction ? Color.blue : Color.clear)
                        
                        Button{
                            tab = .records
                        } label: {
                            Spacer()
                            Text("紀錄")
                            Spacer()
                        }
                        .frame(height: 40)
                        .foregroundColor(tab == .records ? Color.white : Color.blue)
                        .background(tab == .records ? Color.blue : Color.clear)
                
                    }
                    .frame(width: proxy.size.width - 20 )
                    .border(Color.blue)
                    .padding(.horizontal , 10)
                    
                    tab
                        .textBox(width: proxy.size.width - 20 )
                        
                        

                    Image("cfu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * 0.6 , height:  proxy.size.width * 0.6)
                    
                    Group {
                        Text("暫末有紀錄！")
                            .font(.title2)
                        
                        Text("立即使用Call師傅體驗專業裝修維修服務")
                            .font(.body)
                            .padding(.top, 10)
                        
                    }
                    .foregroundColor(Color(red: 0.4666665792, green: 0.4666667581, blue: 0.4705880284))
                    
                    Spacer().layoutPriority(12)
                    
                }
                .frame(  width: .infinity , height: .infinity )
                
            }
            .ignoresSafeArea(edges: .horizontal)
        }
    }
}

struct OrderRecordsPage_Previews: PreviewProvider {
    static var previews: some View {
        OrderRecordsPage()
    }
}
