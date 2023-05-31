//
//  SettingsPage.swift
//  Pocket
//
//  Created by Ryu on 31/5/2023.
//

import SwiftUI

struct SettingsPage: View {
    @State var abc : Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading) {
                    Text("Your account")
                        .foregroundColor(Color(UIColor.label))
                        .fontWeight(.semibold)
                    
                    Text("123123123@privaterelay.appleid.com")
                        .textContentType(.none)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .tint(Color(UIColor.secondaryLabel))
                        .font(.footnote)
                        
                }
                .padding(.top , 12)
                .padding(.horizontal , 32 )
                .frame(maxWidth: .infinity , alignment: .leading)
                
                
                VStack {
                    section {
                        Button {} label: {
                            Text("Go Premium")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .padding(.top, 6)
                        
                        Divider()
                        
                        Button {} label: {
                            Text("Account management")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        
                        Divider()
                        
                        Button(role: .destructive ) {} label: {
                            Text("Log out")
                            
                            Spacer()
                            
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                        .foregroundColor(Color.red)
                        .padding(.bottom, 6)
                    }
                    
                    section("App customization") {
                        
                        Toggle("Show app badge count" , isOn: $abc )
                        
                    }
                    
                    
                    section("About & support") {
                        
                        Button {} label: {
                            Text("Get help and supprt")
                            
                            Spacer()
                            
                            Image(systemName: "questionmark.circle")
                        }
                        .padding(.top, 6)
                        
                        Divider()
                        
                        Button {} label: {
                            Text("Terms of service")
                            
                            Spacer()
                            
                            Image(systemName: "doc.plaintext")
                        }
                        
                        Divider()
                        
                        Button {} label: {
                            Text("Privacy policy")
                            
                            Spacer()
                            
                            Image(systemName: "doc.plaintext")
                        }
                        
                        Divider()
                        
                        
                        Button {} label: {
                            Text("Open source lincenses")
                            
                            Spacer()
                            
                            Image(systemName: "doc.plaintext")
                            
                        }.padding(.bottom, 6)
 
                        
                    }
                    
                    Group {
                        Text("Pocket Clone for IOS")
                        
                        Text("Give me a star if you like it")
                        
                    }
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(.footnote)
                    .padding(1)
                    
                    
                    
                    
                }
                .foregroundColor(Color(UIColor.label))
                
                
            }.navigationTitle("Settings")
        }
    }
    
    
    
    @ViewBuilder func section(_ title : String  = "" , @ViewBuilder content : @escaping () -> some View) -> some View {
        
        VStack(alignment: .leading) {
            
            if title != "" {
                Text(title)
                    .padding(.horizontal , 12)
                    .font(.headline)
            }
                
            VStack(spacing: 12) {
                
               content()
                
            }
            .fontWeight(.regular)
            .font(.callout)
            .frame(maxWidth: .infinity)
            .padding( .horizontal , 12)
            .padding(.vertical , 8)
            .background(Color(UIColor.secondarySystemBackground))
            .clipped()
            .cornerRadius(12)
            
        }.padding()
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
            .environment( \.colorScheme, .dark)
    }
}
