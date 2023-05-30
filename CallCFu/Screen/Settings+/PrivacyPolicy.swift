//
//  PrivacyPolicy.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import SwiftUI

struct PrivacyPolicy: View {
    var body: some View {
        MyNavigationView(title: "私隱政策" , isRoot: false ) {
            
            Spacer()
            
            HStack(spacing: 1 ) {
                Text("All copyright goes to ")
                Link ("Call 師傅" , destination: URL(string: "https://www.callsifu.com/" )! )
            }
        }
    }
}

struct PrivacyPolicy_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicy()
    }
}
