//
//  StorePageView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 15/6/2023.
//

import SwiftUI

struct StorePageView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Text("Store")
                    .bold()
                    .font(.title3)
                
                GeometryReader { proxy in
                    HStack(spacing: 24) {
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "map")
                    }
                    .fontWeight(.semibold)
                    .font(.body)
                    .padding(.leading , proxy.size.width - 85)
                    .padding(.top , 15)
                        
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background {
                RoundedCorner(radius: 24, corners: [.bottomLeft]).ignoresSafeArea().foregroundColor(.mainColor)
            }
            
            
            HStack {
                
            }
            
            Spacer()
        }
    }
}

struct StorePageView_Previews: PreviewProvider {
    static var previews: some View {
        StorePageView()
    }
}
