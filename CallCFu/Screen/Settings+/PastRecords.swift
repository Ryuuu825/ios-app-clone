//
//  PastRecords.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI

struct PastRecords: View {
    
    @State var tel : String = ""
    var body: some View {
        GeometryReader { proxy in
            MyNavigationView(title: "取回記錄" , isRoot: false , bgColor: Color(red: 0.9568627477, green: 0.9568627477, blue: 0.9568627477) ) {
                Spacer()
                
                VStack{
                    Text("取回過往記錄")
                        .font(.title2)
                        .bold()
                        .padding(.bottom )
                        .padding(.top)
                    
                    Text("請輸入手機號碼，我們會以短訊將確認碼發送給你，確認後你便可取回最近半年的柯打及對話記錄。")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    
                    
                    TextField( "輸人手機號碼" ,  text: $tel )
                        .frame(width: proxy.size.width * 0.65 , height: 50)
                        .background(Color(red: 0.9568627477, green: 0.9568627477, blue: 0.9568627477))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button {} label: {
                        Text("發送")
                            .foregroundColor(.white)
                            .frame(width: proxy.size.width * 0.6 , height: 50)
                            .background(Color(red: 0.2979485989, green: 0.5509883404, blue: 0.305899322))
                    }
                        
                    HStack (spacing: 2) {
                        Text("送出取回記錄請求即表示已闋讀並同意Cal師傅的")
                            
                        
                        Text("私隱政策。")
                            .foregroundColor(.orange)
                    }
                    .foregroundColor(.secondaryLabel)
                    .font(.footnote)
                    .padding(.vertical ,5)
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity )
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .clipped()
                .padding()
                
            }
        }
    }
}

struct PastRecords_Previews: PreviewProvider {
    static var previews: some View {
        PastRecords()
    }
}
