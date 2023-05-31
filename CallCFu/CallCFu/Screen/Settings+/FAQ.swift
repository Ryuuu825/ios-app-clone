//
//  FAQ.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI

struct FAQ: View {
    
    let _FAQ : [ (String, String )] = [
        ("問：落了柯打，會有幾多位師傅聯絡我呢？" , "一般最多有 3位師傅聯絡閣下報價，室內裝修及油漆工程則最多5位。" ),
        ("問：如果已約好了其中一位師傅，避免有其他師傅再致電，是按取消嗎？" , "可以按[選擇師傅〕，選了那師傅後，柯打便不會公開讓其他師傅聯絡報價。"),
        ("問：聯絡我的師傅有牌照嗎？" , "能夠成功成為我們的師傅，都會有相關的技術牌照。為了保障自身利益，我們鼓勵用戶在聯絡時要求師傅們上門需出示牌照"),
        ("問：為什麼落柯打後，聯絡我的師傅電話號碼與App内資料不相符？" , "這可能是由於師傅以另一個電話聯絡，如感到不安，可拒絕他們提供的服務，或聯絡我們跟進。為了保障自身利益，我們鼓勵用戶在聯絡時要求師傅們上門需出示牌照。"),
        ("問：如果師傅的態度或服務質素惡劣，我可以向誰反映？" , "對於師傅的服務，您可以在完成柯打後，為師傅評分及留下評語。亦可致電給我們反映。我們會跟進了解。對於服務質素惡劣的師傅，我們會停止該師傅使用本平台的一切權利。"),
        ("問：我找不到合適分類落柯打，怎麼辦呢？" , "可以選擇其他維修或其他需求，在填寫格内，寫上需要的維修服務。"),
        ("問：在落柯打後，可以取消嗎？" , "可以的，但師傅的資料則不再顯示。"),
        ("問：有師傅接柯打後，見到有師傅的聯絡資料，我可以打電話紿他嗎？" , "可以在「柯打記錄1，按入「柯打詳情1，選擇「師傅資料1，便可瀏覽師傅資料，他所擁有的牌照及評分評語。"),
        ("問：如何得知師傅評語？" , "當然可以"),
        ("問：為何有師傅接了柯打後卻取消了？" , "若師傅經初步了解後，沒有興趣接這柯打便會取消。"),
        ("問：師傅上門檢查要收費嗎？" , "不一定，視乎維修項目，師傅上門前，請查詢清楚。"),
        
    ]
    var body: some View {
        MyNavigationView(title: "常見問題" , isRoot : false , bgColor: Color.orange ) {
            ScrollView {
                ForEach(_FAQ , id: \.0) { a in
                    VStack(spacing: 12) {
                        
                        Text(a.0)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .foregroundColor(Color.orange)
                            .bold()
                            
                        
                        Text(a.1)
                            .frame(maxWidth: .infinity , alignment: .leading)
                    }
                    
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .clipped()
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical , 3)
                }

            }
        }
    }
    
}

struct FAQ_Previews: PreviewProvider {
    static var previews: some View {
        FAQ()
    }
}
