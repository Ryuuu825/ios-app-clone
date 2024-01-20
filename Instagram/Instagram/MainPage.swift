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
    let dummyPostText  = """
Having no enemies can be tough, i swore an oath I wouldn't have any enemies a long while back. Despite this having no enemies has lead to a lot of bottled up emotions and I have learned that just because you have no enemies doesn't mean you can't disagree. Everyone should have their own opinions and thought and be respected for that. For anyone who has read this whole comment, thank you for reading😊
"""
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    Header()
                    
                    Story()
                    
                    Rectangle()
                        .frame(height: 0.4)
                        .foregroundColor(.gray)
                        
                    
    //                Posts
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 20) {
                            ImagePost(postText: dummyPostText)
                            ImagePost(postImageNames: ["posts2"], postText: "What a beautiful place")
                        }
                    }

                }
                
                // Story
                ZStack {
                    Color.black.ignoresSafeArea()
                    
                    GeometryReader { proxy in
                        ZStack {
                            Image("posts2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: proxy.size.width, height: proxy.size.height)
                            
                            HStack {
                                Image(systemName: "mappin")
                                Text("草千里")
                            }
                            .padding(.horizontal,4)
                            .padding(.vertical,2)
                            .background(.black)
                            .cornerRadius(4)
                            .offset(x: 130 , y: 120)
                            
                        }
                        
                    }
                    
                    VStack(spacing: 12) {
                        HStack(spacing:4) {
                            ForEach(0..<4) { i in
                                Rectangle()
                                    .frame(width: 370 / 4, height:2)
                                    .cornerRadius(.infinity)
                                    
                            }
                        }
                        
                        HStack {
                            Image("user1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .cornerRadius(.infinity)
                                .padding(4)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("whiz_cat")
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Text("3m")
                                        .foregroundColor(.gray)
                                }
                                
                                HStack {
                                    Image(systemName: "message.fill")
                                        .scaleEffect(CGSize(width: -1, height: 1))
                                        .font(.system(size: 12))
                                        
                                    Text("See translation")
                                        .fontWeight(.semibold)
                                    
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 10))
                                        
                                }
                            }
                            .font(.system(size: 14))
                            
                            Spacer()
                            
                            Image(systemName: "ellipsis")
                            Image(systemName: "xmark")
                                .font(.system(size: 28))
                            
                        }
                        
                    }
                    .padding(.horizontal,8)
                    .offset(y: -360)
                    
                }
                .frame(width: 370)
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
        VStack(spacing: 2) {

            UserIcon(iconName , username , haveStory: haveStory , width: width)
           
            
            Text(username)
                .fontWeight(.regular)
                .font(.subheadline)
        }
    }
    
    @ViewBuilder
    func UserIcon(_ iconName : String , _ username : String, haveStory : Bool = false , width: CGFloat = 30) -> some View {


            Image(iconName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .cornerRadius(.infinity)
                .padding(4)
                .overlay {
                    
                    if haveStory {
                        Circle()
                            .stroke(LinearGradient(colors: [.yellow , Color.mainColor], startPoint: .bottomLeading, endPoint: .topTrailing) , lineWidth: width > 45 ? 3 : 1.8)
                    } else {
                        Circle()
                            .stroke(.gray , lineWidth: 1)
                            
                    }
                    
                   
                }

    }
    
    @ViewBuilder
    func UserIconGroup(_ iconNames : [String] = ["user1" , "user2" , "user3"] ) -> some View {

        ZStack {
            
            ForEach(iconNames.indices , id:\.hashValue) { i in
                
                Image(iconNames[i])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 18, height: 18)
                    .cornerRadius(.infinity)
                    .padding(4)
                    .background {
                        
                        Circle()
                            .frame(width: 25)
                            .foregroundColor(.black)
                        
                    }
                    .offset(x: CGFloat(i == 0 ? CGFloat(0) : CGFloat(15 + 10 * (i-1))))
                    .zIndex(Double(iconNames.count - i))
            }
            
        }
        .frame(width: CGFloat(15 + 10 * (iconNames.count)), alignment: .leading)
    }
    
    @ViewBuilder
    func ImagePost(_ userIcon : String = "user2" , _ userName: String = "sumo.ryu", _ haveStory : Bool = true, postImageNames : [String] = ["posts1", "posts2"] , postText : String) -> some View {
        VStack {
            HStack {
                UserIcon(userIcon, userName, haveStory: haveStory)
                
                Text(userName)
                    .font(.system(size:16))
                    .fontWeight(.medium)
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.top , 4)
            .padding(.horizontal, 4)
            
            if postImageNames.count > 1 {
                TabView {
                    ForEach(postImageNames, id:\.hashValue) { i in
                        Image(i)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 390, height: 300)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(.page)
            } else {
                Image(postImageNames[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 390, height: 300)
            }
        

            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 22)
                    
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 21, height: 22)
                        .scaleEffect(CGSize(width: -1, height: 1))
                    
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 19, height: 22)
                        .rotationEffect(.degrees(25))
                        .offset(y:-2)
                    
                    Spacer()
                    
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 20, height: 22)
                }
                .fontWeight(.regular)
            
                
                HStack {
                    
                    UserIconGroup()
                    
                    HStack(spacing: 4) {
                        Text("Liked by")
                        
                        Text("sum_sulek")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                        
                        Text("and")
                        
                        Text("5501 others")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                    }
                    
                    Spacer()
                    
                }
                .font(.system(size: 13))
                
                ExpanablePostText(postText: postText)
                
                
            }
            .padding(.horizontal , 12)
            .padding(.top , 8)
        }
        .frame(maxWidth: .infinity)
    }
    
}

struct ExpanablePostText : View {
    let postText : String
    @State var isExpand : Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            
            if postText.count > 10 {
                if isExpand {
                    Text("**sumo.ryu** \(String(postText))" )
                } else {
                    let truncatedText = postText.prefix(50)
                    Text("**sumo.ryu** \(String(truncatedText))... " ) + Text("more").foregroundColor(.gray)
                }
            } else {
                Text("**sumo.ryu** \(postText)")
            }
            
        }
        .font(.system(size: 14))
        .frame(maxWidth: .infinity , alignment: .leading)
        .onTapGesture {
            isExpand = true
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
