//
//  Aboutus.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI

struct Aboutus: View {
    var body: some View {
        MyNavigationView(title: "關於我們" , isRoot: false ) {
            
            ScrollView {
                VStack(spacing: 16 ) {
                    Text("About Me")
                        .font(.title2)
                        .frame(maxWidth: .infinity , alignment: .leading )
                        .bold()
                    
                    Text("I am cloning [Call 師傅] app to learn how to build an IOS application and prepare for the World Skill competition.")
                        
                }
                .padding()
                
                
                VStack(spacing: 16 ) {
                    Text("About Call 師傅")
                        .font(.title2)
                        .frame(maxWidth: .infinity , alignment: .leading )
                        .bold()
                    
                    Text("""
        隨著智能手機的成熟，我們(種子策劃有限公司 www.seedblooming.com)深信流動應用程式的發展，將會改變工作及生活模式。我們所期望並不是創造傳奇式的創業故事，參與時興的金融遊戲。而是利用資訊科技的技能，提升整體生活的效率，解決市場某些需求。 事實上，簡單並貼地的產品，並不會帶來豐厚的收入，但科技演進的根本就是提升生活品質及效率。

        Call師傅是專門為維修裝修行業而設的服務配對平台，讓大眾透過手機應用程式輕鬆快捷地尋找可靠及專業的師傅。 我們致力保障用戶，所以師傅們必先經過專業資格的審核程序，擁有一定服務經驗。 同時，我們設有黑名單功能及評分系統，並會禁止劣評的師傅接單報價的服務。

        自14年12月底推出市面以來，「Call 師傅」得到不少回響及意見，在我們追求盡善盡美的執念底下，我們不停搜集用戶及師傅們的意見，不斷推出新功能及服務。 2015年8月，經多輪評審後，我們正式加入了數碼港培育計劃。更於2016年獲取香港資訊及科技奬ICT AWARDS 金奬，獲得評審團一致的讚賞。

        至今，有賴各界的支持，Call師傅的註冊師傅數量已超過 9500 多位，而累計柯打亦超過 370,000 隻了。 我們會繼續努力，好讓「Call 師傅」能得以延續並成長，繼續為社會提供服務，提升 \"搵師傅\" 的效率。
    """)
                        
                }
                .padding()

            }
            
        }
    }
}

struct Aboutus_Previews: PreviewProvider {
    static var previews: some View {
        Aboutus()
    }
}
