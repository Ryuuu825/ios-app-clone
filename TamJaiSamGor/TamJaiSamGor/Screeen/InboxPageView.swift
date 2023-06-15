//
//  InboxPageView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 12/6/2023.
//

import SwiftUI

struct InboxPageView: View {
    
    @State var onTab : Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    
                    Text("Inbox")
                        .frame(maxWidth: .infinity , alignment: .center)
                        .bold()
                        .font(.title2)
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            onTab = 1
                        } label: {
                            VStack {
                                Text("Promotion")
                                Rectangle()
                                    .frame(width: onTab == 1 ? 30 : 0 , height: 3)
                            }
                            .foregroundColor(onTab == 1 ? .white : Color(UIColor.systemGray2))
                        }
                        
                        Spacer()
                        
                        Button { onTab = 2 } label: {
                            VStack {
                                Text("Personal")
                                Rectangle()
                                    .frame(width: onTab == 2 ? 30 : 0 , height: 3)
                            }
                            .foregroundColor(onTab == 2 ? .white : Color(UIColor.systemGray2))
                        }
                        
                        Spacer()
                    }
                    .padding(8)
                    
                }
                .foregroundColor(.white)
                .frame(width: .infinity , height: 100)
                .background(RoundedCorner(radius: 24, corners: [.bottomLeft]).ignoresSafeArea().foregroundColor(.mainColor))
                
                
                
                if onTab == 1 {
                    
                    Spacer()
                    
                    Image("noodles")
                        .resizable()
                        .frame(width: 300, height: 200)
                    
                        
                } else {
                    
                    LazyVStack {
                        ForEach(1..<5) { _ in
                            HStack(alignment: .top) {
                                Image(systemName: "bell.fill")
                                
                                VStack(alignment: .leading) {
                                    Text("22 hour(s) ago")
                                        .font(.footnote)
                                        .fontWeight(.light)
                                        .foregroundColor(Color(UIColor.systemGray))
                                    
                                    Text("Hello SamGor Spicy Clubmember, your exclusive welcome offer is ready in \"My Reward\"🎁. Click and explore im more detail!")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                                .padding(.horizontal)
                     
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal,4)
                            
                            Divider()
                            
                           
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct InboxPageView_Previews: PreviewProvider {
    static var previews: some View {
        InboxPageView()
    }
}
