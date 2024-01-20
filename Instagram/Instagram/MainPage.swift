//
//  MainPage.swift
//  Instagram
//
//  Created by Ryu on 20/1/2024.
//

import SwiftUI

extension Color {
    static let mainColor = Color(red: 0.9284570813, green: 0, blue: 0.8171131611)
}

struct MainPage: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Header()
                
                Story()
                
//                Posts
                
                ScrollView(.vertical) {
                    VStack {
                        HStack {
                            UserIcon("user2", "sumo.ryu", haveStory: true)
                            Text("sumo.ryu")
                                .fontWeight(.medium)
                            
                            Spacer()
                            
                            Image(systemName: "ellipsis")
                        }
                        .padding(.horizontal, 4)
                        
                        Image("posts1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 350)
                        
                        VStack(spacing: 8) {
                            HStack(spacing: 12) {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                                Image(systemName: "message")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .scaleEffect(CGSize(width: -1, height: 1))
                                
                                Image(systemName: "paperplane")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .rotationEffect(.degrees(19))
                                    .offset(y:-2)
                                
                                Spacer()
                                
                                Image(systemName: "bookmark")
                                    .resizable()
                                    .frame(width: 20, height: 22)
                            }
                            .fontWeight(.regular)
                        
                            
                            HStack {
                                ZStack {
                                    
                                    Image("user3")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20)
                                        .cornerRadius(.infinity)
                                        .padding(4)
                                        .offset(x: 40)
                                    
                                    Image("user2")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20)
                                        .cornerRadius(.infinity)
                                        .padding(4)
                                        .background {
                                            Circle()
                                                .foregroundColor(.black)
                                        }
                                        .offset(x: 20)
                                        
                                    
                                    Image("user1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 20)
                                        .cornerRadius(.infinity)
                                        .padding(4)
                                        .background {
                                            Circle()
                                                .foregroundColor(.black)
                                        }
                                        
                                }
                                .frame(width: 70, alignment: .leading)
                                
                                HStack(spacing: 4) {
                                    Text("Liked by")
                                    
                                    Text("sum_sulek")
                                        .fontWeight(.medium)
                                        .font(.system(size: 15))
                                    
                                    Text("and")
                                    
                                    Text("5501 others")
                                        .fontWeight(.medium)
                                        .font(.system(size: 15))
                                }
                                
                                Spacer()
                                
                            }
                            .font(.system(size: 14))
                            
                            HStack {
                                Text("sumo.ryu")
                                    .fontWeight(.semibold)
                                
                                Text("I have no enemies")
                            }
                            .font(.system(size: 16))
                            .frame(maxWidth: .infinity , alignment: .leading)
                            
                            
                        }
                        .padding(.horizontal , 12)
                        .padding(.top , 12)
                    }
                }

                
               
            }
        }
        .preferredColorScheme(.dark)
    }
}

extension MainPage {
    @ViewBuilder
    func Header() -> some View {
        HStack {
            HStack {
                Image("text_icon")
                    .resizable()
                    .frame(width:160, height: 50)
                
                Image(systemName: "chevron.down")
            }
            
            Spacer()
            
            HStack {
                Image(systemName:"heart")
                
                ZStack {
                    Image(systemName: "message")
                    Text("1")
                        .font(.system(size:14))
                        .background {
                            Circle()
                                .frame(width: 30)
                                .foregroundColor(.red)
                        }
                        .offset(x:10,y:-10)
                }
                    
            }
            .fontWeight(.medium)
            .font(.title2)
            .padding(.trailing, 12)
        }
        
    }
    
    @ViewBuilder
    func Story() -> some View {
        ScrollView(.horizontal) {
            
            HStack {
                VStack(spacing: 10) {
                    
                    ZStack {
                        
                        Circle()
                            .frame(width: 80)
                            .foregroundColor(.black)
                            .overlay {
                                Circle()
                                    .stroke(.gray , lineWidth: 1)
                                    .padding(.top , 1)
                            }
                        
                        Image(systemName: "plus")
                            .fontWeight(.medium)
                            .padding(4)
                            .background {
                                Circle()
                                    .foregroundColor(.blue)
                            }
                            .offset(x: 30, y: 25)
                    }
                    
                    Text("Your story")
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                        .font(.subheadline)
                }
                .padding(.horizontal, 15)
                
                HStack(spacing: 10) {
                    UserStoryIcon("user1" , "whiz_cat" , haveStory: true)
                    UserStoryIcon("user2" , "sumo.ryu")
                    UserStoryIcon("user3" , "sam_sulek")

                }
            }
        }
    }
    
    @ViewBuilder
    func UserStoryIcon(_ iconName : String , _ username : String, haveStory : Bool = false , width: CGFloat = 75) -> some View {
        VStack(spacing: 10) {

            UserIcon(iconName , username , haveStory: haveStory , width: width)
           
            
            Text(username)
                .fontWeight(.medium)
                .font(.subheadline)
        }
    }
    
    @ViewBuilder
    func UserIcon(_ iconName : String , _ username : String, haveStory : Bool = false , width: CGFloat = 30) -> some View {


            Image(iconName)
                .resizable()
                .scaledToFill()
                .frame(width: width)
                .cornerRadius(.infinity)
                .padding(4)
                .overlay {
                    
                    if haveStory {
                        Circle()
                            .stroke(LinearGradient(colors: [.yellow , Color.mainColor], startPoint: .bottomLeading, endPoint: .topTrailing) , lineWidth: width > 45 ? 3 : 2)
                    } else {
                        Circle()
                            .stroke(.gray , lineWidth: 1)
                            
                    }
                    
                   
                }

    }

}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
