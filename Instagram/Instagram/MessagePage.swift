//
//  MessagePage.swift
//  Instagram
//
//  Created by Ryu on 23/1/2024.
//

import SwiftUI

struct MessagePageLeadingNavigationBar : View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
            Text("sumo.ryu")
        }
        .font(.title2)
        .fontWeight(.semibold)
        
    }
}

struct MessagePageTrailingNavigationBar : View {
    var body: some View {
        
        Image(systemName: "square.and.pencil")
            .font(.title2)
            .fontWeight(.semibold)

    }
}


struct MessagePage: View {
    @State var searchText : String = ""
    
    var body: some View {
        
        VStack {
            HStack {
                MessagePageLeadingNavigationBar()
                Spacer()
                MessagePageTrailingNavigationBar()
            }
            .padding(.horizontal, 12)
            
            ScrollView(.vertical) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                    Spacer()
                }
                .padding(.leading, 12)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(Color(uiColor: .secondarySystemBackground))
                
                .cornerRadius(12)
                .padding(.horizontal, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        VStack {
                            ZStack {
                                Image("")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(.infinity)
                                    .padding(4)
                                    
                                    .overlay {
                                        Circle()
                                            .stroke(.gray)
                                    }
                                    .offset(y: 20)
                                
                                ZStack {
                                    Text("Note")
                                        .font(.system(size: 14))
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 8)
                                        .background(Color(uiColor: .secondarySystemBackground))
                                        .cornerRadius(12)
                                        .foregroundColor(.gray)
                                    
                                    Circle()
                                        .frame(width: 12)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                                        .offset(y: 20)
                                    Circle()
                                        .frame(width: 8)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                                        .offset(x: 10 , y: 30)
                                }
                                .offset(x:-15, y: -35)
                            }
                            .frame(height: 120)
                            
                            Text("Your note")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                        }
                        
                        VStack {
                            ZStack {
                                Image("user2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(.infinity)
                                    .padding(4)
                                    .offset(y: 20)
                                
                                ZStack {
                                    Text("Eat till failure")
                                        .frame(width: 90)
                                        .font(.system(size: 14))
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 8)
                                        .background(Color(uiColor: .secondarySystemBackground))
                                        .cornerRadius(12)
                                        .foregroundColor(.gray)
                                    
                                    Circle()
                                        .frame(width: 12)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                                        .offset(y: 20)
                                    Circle()
                                        .frame(width: 8)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                                        .offset(x: 10 , y: 30)
                                }
                                .offset(x:-1, y: -35)
                            }
                            .frame(height: 120)
                            
                            Text("祝君安好")
                                .font(.system(size: 14))
                            
                        }
                        
                        VStack {
                            ZStack {
                                Image("user3")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(.infinity)
                                    .padding(4)
                                    .offset(y: 20)
                                
                                ZStack {
                                    Text("Leg day👩🏻‍🦽")
                                        .frame(width: 60)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 14))
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 8)
                                        .background(Color(uiColor: .secondarySystemBackground))
                                        .cornerRadius(12)
                                        .foregroundColor(.gray)
                                        
                                    
                                    Circle()
                                        .frame(width: 12)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                                        .offset(y: 20)
                                    Circle()
                                        .frame(width: 8)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                                        .offset(x: 10 , y: 30)
                                }
                                .frame(width: 90)
                                .cornerRadius(0)
                                .offset(x:-1, y: -35)
                            }
                            .frame(height: 120)
                            
                            
                            Text("sam_sulek")
                                .font(.system(size: 14))
                            
                        }
                        
                        
                        VStack {
                            ZStack {
                                Image("user1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(.infinity)
                                    .padding(4)
                                    .offset(y: 20)
                                
                                Circle()
                                    .frame(width: 15)
                                    .foregroundColor(.green)
                                    
                                    .overlay {
                                        Circle()
                                            .stroke(.black, lineWidth: 3)
                                    }
                                     .offset(x: 25,y:45)
                            }
                            .frame(height: 120)
                            
                            Text("whiz_cat")
                                .font(.system(size: 14))
                            
                        }
                    }
                    .padding(.leading, 12)
                }
                
                HStack {
                    Text("Messages")
                        .fontWeight(.bold)
                    Spacer()
                    Text("Request(2)")
                        .fontWeight(.medium)
                        .foregroundColor(Color(uiColor: .link))
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 12)
                
                UnreeadMessageRow("Ian" , "user1")
                ReadedMessageRow("Ryu" , "user2")
                ReadedMessageRow("Sandwich" , "highlight1" , message: "Seen last week")
                ReadedMessageRow("祝君安好" , "" , message: "Active 12m ago")
                
                
                
                HStack {
                    Image("user3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .cornerRadius(.infinity)
                        .padding(4)
                        
                        .overlay {
                            Circle()
                                .stroke(.gray)
                        }
                        
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Sam Sulek")
                        Text("Today I hit legs").foregroundColor(.gray) + Text(" ᐧ 2h").foregroundColor(.gray).fontWeight(.light)
                        
                    }
                    .font(.system(size: 15.3))
                    .fontWeight(.medium)
                    .padding(.leading, 4)
                    
                    Spacer()
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundColor(Color(uiColor: .link))
                        .hidden()
                    
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 24, height: 20)
                        .fontWeight(.bold)
                        .padding(.leading , 12)
                        .foregroundColor(.gray)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)

               
            }
            .frame(maxWidth: .infinity)
        }
        .preferredColorScheme(.dark)
        
        
        
    }
}

extension MessagePage {
    @ViewBuilder
    func UnreeadMessageRow(_ username : String , _ userIcon : String , unreadMessageCount : Int = 4 , lastSeen : Int = 2 ) -> some View {
        HStack {
            Image(userIcon)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(.infinity)
                .padding(4)
            
                .overlay {
                    Circle()
                        .stroke(.gray)
                }
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(username)").fontWeight(.semibold)
                Text("\(unreadMessageCount)+ new messages").bold() + Text(" ᐧ \(lastSeen)h").foregroundColor(.gray).fontWeight(.light)
                
            }
            .font(.system(size: 15.3))
            .fontWeight(.medium)
            .padding(.leading, 4)
            
            Spacer()
            
            Circle()
                .frame(width: 10)
                .foregroundColor(Color(uiColor: .link))
            
            Image(systemName: "camera")
                .resizable()
                .frame(width: 24, height: 20)
                .fontWeight(.bold)
                .padding(.leading , 12)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func ReadedMessageRow(_ username : String , _ userIcon : String , message : String = "Sent 1h ago") -> some View {
        HStack {
            Image(userIcon)
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .cornerRadius(.infinity)
                .padding(4)
                
                .overlay {
                    Circle()
                        .stroke(.gray)
                }
                
            VStack(alignment: .leading, spacing: 2) {
                Text(username)
                Text(message).foregroundColor(.gray)
                
            }
            .font(.system(size: 15.3))
            .fontWeight(.regular)
            .padding(.leading, 4)
            
            Spacer()
            
            Circle()
                .frame(width: 10)
                .foregroundColor(Color(uiColor: .link))
                .hidden()
            
            Image(systemName: "camera")
                .resizable()
                .frame(width: 24, height: 20)
                .fontWeight(.bold)
                .padding(.leading , 12)
                .foregroundColor(.gray)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

struct MessagePage_Previews: PreviewProvider {
    static var previews: some View {
       
       
        MessagePage()
      
        
    }
}
