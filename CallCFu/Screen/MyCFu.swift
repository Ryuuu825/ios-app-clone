//
//  MyCFu.swift
//  CallCFu
//
//  Created by Ryu on 29/5/2023.
//

import SwiftUI

enum MyCFuTab : String , View , CaseIterable {
    case like = "讚好師傅" , block = "封鎖師傅"
    
    var body: some View {
        switch self {
            case .like: Text("您已讚好以下師傅")
            case .block: Text("封鎖師傅將不會再看到您下的柯打")
        }
    }
    
}

struct MyCFuPage: View {
    
    @State var onTab : MyCFuTab = .like
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    VStack {
                        VStack {
                            Text("我的師傅")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding(10)
                        }
                        .background( Color(red: 1, green: 0.5882030129, blue: 0.0004810865503).ignoresSafeArea(.all) )
                        
                        
                        VStack {
                            HStack {
                                
                                ForEach(MyCFuTab.allCases , id:\.self) { t in
                                    Button {
                                        onTab = t
                                    } label: {
                                        VStack {
                                            Text(t.rawValue)
                                                .fontWeight(.medium)
                                                
                                            
                                            Rectangle()
                                                .frame( height: onTab == t ? 4 : 1 )
                                                .foregroundColor(.orange)
                                                .padding(.horizontal)
                                        }
                                        .foregroundColor(onTab == t ? Color(red: 0.9451568723, green: 0.5333004594, blue: 0.0004150405002) : .gray)
                                    }
                                }
                                
                            }
                            .frame(width: .infinity)
                            
                            onTab
                                .padding(.top , 10)
                                .multilineTextAlignment(.leading)
                                .frame(width: .infinity , alignment: .leading)
                            
                            Spacer()
                        }
                
                    }
                    .background(Color(red: 0.9176469445, green: 0.9137256742, blue: 0.9372537136))
                    
                }.ignoresSafeArea(edges: .horizontal)
            }
            
        }
    }
}

struct MyCFu_Previews: PreviewProvider {
    static var previews: some View {
        MyCFuPage()
    }
}
