//
//  PurchaseRecord.swift
//  mcl-cinemas
//
//  Created by Ryu on 14/1/2024.
//

import SwiftUI



struct PurchaseRecord: View {
    var body: some View {
        ScrollView {
            HStack(alignment:.top) {
                Image(systemName: "ticket")
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(-30))
                    .padding()
                    .overlay {
                        Circle()
                            .stroke(.gray, lineWidth: 1)
                    }
                    .frame(width: 100)
                
                VStack {
                    Text("THE FIRST SLAM DUNK Japanese")
                        .foregroundColor(Color(red: 0.4134429052, green: 0.4185233369, blue: 0.5053279579))
                        .bold()
                        .font(.system(size:17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    
                    Group {
                        Text("戲院：MCL 德福戲院")
                        Text("日期/ 時間：2024年01月12日 21:35")
                        Text("影院：4院")
                        Text("座位：E10，E11，E12")
                        Text("總計：HK$165")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size:14))
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.cbgColor2)
                        .padding(.top)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
            
            HStack(alignment:.top) {
                Image(systemName: "ticket")
                    .foregroundColor(.gray)
                    .rotationEffect(.degrees(-30))
                    .padding()
                    .overlay {
                        Circle()
                            .stroke(.gray, lineWidth: 1)
                    }
                    .frame(width: 100)
                
                VStack {
                    Text("新世紀福音戰士新劇場版：終")
                        .foregroundColor(Color(red: 0.4134429052, green: 0.4185233369, blue: 0.5053279579))
                        .bold()
                        .font(.system(size:17))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    
                    Group {
                        Text("戲院：MCL 德福戲院")
                        Text("日期/ 時間：2023年01月12日 21:35")
                        Text("影院：4院")
                        Text("座位：E10，E11，E12")
                        Text("總計：HK$165")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size:14))
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.cbgColor2)
                        .padding(.top)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
            
            
        }
        .preferredColorScheme(.dark)
        .frame(maxWidth: .infinity)
        .background {
            Color.bgColor
        }
    }
}

struct PurchaseRecord_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseRecord()
    }
}
