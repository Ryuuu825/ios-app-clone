//
//  SettingPageView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 15/6/2023.
//

import SwiftUI

struct SettingPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing: 12){
                        
                        HStack {
                            Text("Ken")
                                .bold()
                                .font(.title2)
                            
                            
                            Spacer()
                            
                            HStack {
                                Text("$ 0")
                                    .fontWeight(.heavy)
                                    .font(.title2)
                                    .foregroundColor(Color(red: 0.9058998227, green: 0.8274454474, blue: 0.6941292882))
                                
                                Text("/ $300")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top , 24)
                        
                        HStack {
                              
                            Text("PRE-MEMBER")
                                .font(.caption)
                                .padding(.horizontal,  8)
                                .padding(.vertical,  4)
                                .background {
                                    RoundedCorner(radius: 20, corners: [.topLeft, .bottomRight])
                                        .foregroundColor(.black)
                                }
                                
                            Spacer()
                            
                            
                            Rectangle()
                                .frame(width: 200, height: 12)
                                .cornerRadius(.infinity)
                            
                            Image(systemName: "crown.fill")
                                .font(.caption)
                                .foregroundColor(Color(UIColor.systemGray3))

                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                            
                            Text("Spent $300 and upgrade to VIP")
                                .font(.caption2)
                        }
                        .padding(.horizontal)
                        .padding(.top , -8)
                    }
                    .padding(.bottom , 32)
                    
                    
                    VStack {
                        
                   
                        LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3)) {
                            VStack(spacing: 8) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.mainColor)
                                    .padding(4)
                                    .background {
                                        Circle()
                                            .stroke()
                                    }
                                    
                                Text("My Stamp")
                                    .font(.caption)
                            }
                            
                           
                            
                            VStack(spacing: 8) {
                                Image(systemName: "gift")
                                    .foregroundColor(.mainColor)
                                    .font(.system(size: 24))
                                    
                                    
                                Text("My Reward")
                                    .font(.caption)
                            }
                                
                             
                           
                                
                            VStack(spacing: 8) {
                                Image(systemName: "list.clipboard")
                                    .foregroundColor(.mainColor)
                                    .font(.system(size: 24))
                                    
                                Text("Transaction History")
                                    .font(.caption)
                                    .lineLimit(2)
                            }
                        }
                        .padding(.vertical)
                        .padding(.trailing)
                        
                        
                        VStack(spacing: 0) {
                            
                            VStack(spacing: 20) {
                                HStack {
                                    Label("My Profile", systemImage: "person")
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                
                                Divider()
                                
                                HStack {
                                    Label("Payment Methods" , systemImage: "person")
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }

                            }
                            .padding(.top , 12)
                            .padding()
                            
                            Rectangle()
                                .frame(width: .infinity)
                                .foregroundColor(Color(UIColor.secondarySystemBackground))
                            
                            VStack(spacing: 20) {
                                HStack {
                                    Label("Language", systemImage: "globe")
                                    
                                    Spacer()
                                    
                                    Text("English")
                                        .font(.caption)
                                        .foregroundColor(.mainColor)
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                
                                Divider()
                                
                                HStack {
                                    
                                    Toggle(isOn: .constant(true)) {
                                        Label("Notification" , systemImage: "bell")
                                    }
                                    .tint(.mainColor)
                                }
                                
                                Divider()
                                
                               
                                
                                HStack {
                                    Label("About us", systemImage: "info.circle")
                                    
                                    Spacer()
                                    
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                
                                Divider()
                                
                                HStack {
                                    Label("Contact Us", systemImage: "ellipsis.message")
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                                
                                Group {
                                    Divider()
                                    
                                    HStack {
                                        Label("Terms & Confitions", systemImage: "list.clipboard")
                                        
                                        Spacer()
                                        
                                       
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color(UIColor.secondaryLabel))
                                    }
                                }

                            }
                            .padding()
                            
                            Rectangle()
                                .frame(width: .infinity)
                                .foregroundColor(Color(UIColor.secondarySystemBackground))
                            
                            VStack {
                                HStack {
                                    Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                                    
                                    Spacer()
                                    
                                   
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                }
                            }
                            .padding()
                            
                            VStack(spacing: 32) {
                                Text("Version 1.1.2")
                                    
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                
                                Text("Delete Account")
                                
                                    .underline()
                            }
                            .font(.system(size: 13))
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .padding()
                            
                            Color.clear.frame(height: 20)
                            
                            
                        }
                        .font(.callout)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background {
                            RoundedCorner(radius: 32 , corners: [.topLeft])
                                .foregroundColor(.white)
                        }
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background {
                        RoundedCorner(radius: 32 , corners: [.topLeft])
                            .foregroundColor(Color(red: 0.964710772, green: 0.9411751628, blue: 0.9215704799))
                    }
                   
                }
                .background {
                    LinearGradient(colors: [  Color(red: 0.4490637422, green: 0.04403692931, blue: 0.03240876347), Color.mainColor ], startPoint: .leading, endPoint: .trailing)
                        .ignoresSafeArea()
                }
                
            }
            .foregroundColor(.white)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
}

struct SettingPageView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            SettingPageView()
        }
    }
}
