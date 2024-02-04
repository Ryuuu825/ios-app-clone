//
//  MainPage.swift
//  Instagram
//
//  Created by Ryu on 20/1/2024.
//

import SwiftUI
import Giffy
import AVKit

extension Color {
    static let mainColor = Color(red: 0.9284570813, green: 0, blue: 0.8171131611)
}

enum MainPageShowViewStatus {
    case Nth
    case Story
    case Comment
}

struct PostModel : Codable {
    let author : UserModel?
    let image : [String]
    let text : String
    let likes : [UserModel]?
    let comments : [UserComment]?
    let date : String
    let id : Int
}
 

struct UserModel : Codable {
    let name : String
    let icon : String
    let isCloseFriend : Bool
    let haveStory : Bool
    let id : Int
}

struct MeUserModel : Codable {
    let name : String
    let icon : String
    let isCloseFriend : Bool
    let haveStory : Bool
    let id : Int
    let followed : [UserModel]
}

struct UserComment : Codable {
    let user : UserModel?
    let post : PostModel?
    let value : String
    let type : String
    let date : String
    let comments : [UserCommentComment]?
    let id : Int
}

struct DF {
    static func toDate(str : String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        return dateFormatter.date(from: str)!
    }
    
    static func sinceTimeString(str: String) -> String {
        let d = DF.toDate(str: str)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute]
        
        return formatter.string(from: d.timeIntervalSinceNow)!.split(separator: " ")[0].replacingOccurrences(of: "-", with: "") + " ago"
    }

}
struct MainPage: View {
    let dummyPostText  = """
Having no enemies can be tough, i swore an oath I wouldn't have any enemies a long while back. Despite this having no enemies has lead to a lot of bottled up emotions and I have learned that just because you have no enemies doesn't mean you can't disagree. Everyone should have their own opinions and thought and be respected for that. For anyone who has read this whole comment, thank you for reading😊
"""
    
    @State var showStatus : MainPageShowViewStatus = .Nth
    
    @State var t = false
    
    @State var me: [MeUserModel]? = nil
    @State var users : [UserModel]? = nil
    @State var postsData : [PostModel]? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                ScrollView {
                    Header()

                    StoryIcon()

                    Rectangle()
                        .frame(height: 0.4)
                        .foregroundColor(.gray)

                
                    VStack(spacing: 20) {
                        
                        if (postsData != nil) {
                            ForEach(postsData! , id:\.id) { post in
                                ImagePost(post.author!.icon , post.author!.name , post : post)
                            }
                        }
                        
                        
                        SponsoredImagePost("http://127.0.0.1:9999/user3.jpg" , "247 Fitness" , postImageNames: ["ad1"] , postText: "Let's get started! ")
                        // ReelPost(postText: "ayo" )
                    }
                    .onAppear {
                        let url = URL(string: "http://localhost:5022/api/post")!
                        URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r, _ in
                            guard let d = d else {return} ;
                            postsData = try? JSONDecoder().decode([PostModel].self , from: d)
                            
                        }.resume()
                    }
                    

                }
                
                if showStatus == .Story {
                    StoryPage {
                        showStatus = .Nth
                    }
                        .background(.black)
                        .animation(.spring(), value: showStatus)
                }
                
                if showStatus == .Comment {
                    Color.black.opacity(0.7)
                        .frame(height: 750)
                        .onTapGesture {
                            showStatus = .Nth
                        }
                    
                }
            }
            .background(.black)
            .sheet(isPresented: .constant(showStatus == .Comment)) {
                CommentPage()
            }
            
        }
        .preferredColorScheme(.dark)
        .onAppear {
            let url = URL(string: "http://localhost:5022/api/me")!
            URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r, _ in
                
                guard let d = d else {return}
                me = try? JSONDecoder().decode([MeUserModel].self, from:d)
                
            }.resume()
        }
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
    func StoryIcon() -> some View {
  
        ScrollView(.horizontal) {
            
            HStack {
                if me != nil {
                    VStack(spacing: 6) {
                        
                        ZStack {
                            
                            let firstProfile = me!.first!
                            
                            UserIcon(firstProfile.icon , firstProfile.name , haveStory: firstProfile.haveStory , isCloseFriend : firstProfile.isCloseFriend, width: 75)
                            
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
                }
                
                HStack(spacing: 10) {
                    
                    if users != nil {
                        ForEach(users!, id:\.id) { user in
                            UserStoryIcon(user.icon , user.name , haveStory: user.haveStory , isCloseFriend: user.isCloseFriend)
                        }
                    }
                }
                .onAppear {
                    let url = URL(string: "http://localhost:5022/api/user")!
                    URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r, _ in
                        
                        guard let d = d else {return}
                        users = try? JSONDecoder().decode([UserModel].self, from:d)
                        users = users?.filter{ $0.id != me?.first?.id }
                        
                    }.resume()
                }
            }
            .padding(.top , 4)
        }
    }
    
    @ViewBuilder
    func UserStoryIcon(_ iconName : String , _ username : String, haveStory : Bool = false, isCloseFriend : Bool = false , width: CGFloat = 75) -> some View {
        VStack(spacing: 6) {

            UserIcon(iconName , username , haveStory: haveStory , isCloseFriend : isCloseFriend , width: width)
           
            
            Text(username)
                .fontWeight(.regular)
                .font(.subheadline)
        }
        .onTapGesture {
            showStatus = .Story
        }
    }
    
    
    
    func filterFollowerLikedPost(post: PostModel) -> [UserModel] {
        return post.likes!.filter { d in
            guard let me = me?.first else {
                return false
            }
            return me.followed.contains { follower in
                return follower.id == d.id
            }
        }
    }
    @ViewBuilder
    func UserIconGroup(post : PostModel ) -> some View {
        
        let filtered = filterFollowerLikedPost(post: post)
        let _ = print(filtered)
        
        ZStack {
            
            ForEach(filtered.indices , id:\.hashValue) { i in
                
                AsyncImage(url: URL(string: filtered[i].icon)) { image in
                    image
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
                        .zIndex(Double(filtered.count - i))
                } placeholder: {
                    
                }
                
            }
        }
        .frame(width: CGFloat(15 + 10 * (filtered.count)), alignment: .leading)
    }
    
    @ViewBuilder
    func ImagePost(_ userIcon : String = "user2" , _ userName: String = "sumo.ryu", _ haveStory : Bool = true, post : PostModel) -> some View {
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
            
            if post.image.count > 1 {
                TabView {
                    ForEach(post.image, id:\.hashValue) { i in
                        Image(i)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 390, height: 300)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(.page)
            } else {
                
                AsyncImage(url: URL(string: post.image[0])) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 390, height: 300)
                } placeholder: {
                    
                }

                    
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
                        .onTapGesture {
                            showStatus = .Comment
                        }
                    
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
            
                
                if post.likes!.count > 0 {
                    HStack {
                        
                        UserIconGroup(post: post)
                        
                        HStack(spacing: 4) {
                            Text("Liked by")
                            
                            if post.likes!.count > 1 {
                                Text(String(post.likes!.randomElement()!.name))
                                    .fontWeight(.semibold)
                                    .font(.system(size: 14))
                                
                                Text("and")
                            }
                            
                            Text("\(String(post.likes!.count)) others")
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                        }
                        
                        Spacer()
                        
                    }
                    .font(.system(size: 13))
                } else {
                    Color.clear.frame(height: 2)
                }
                
                ExpanablePostText(userName: userName , postText: post.text)
                
                
                if post.comments!.count > 0 {
                    Text("View all \(post.comments!.count) comments")
                        .font(.system(size: 13.5))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Circle()
                        .frame(height: 25)
                        .foregroundColor(.black)
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 0.5)
                        }
                    
                    Text("Add a comment...")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 8)
                
//
                Text( DF.sinceTimeString(str: post.date))
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
               
                
            }
            .padding(.horizontal , 12)
            .padding(.top , 8)
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func ReelPost(_ userIcon : String = "user2" , _ userName: String = "sumo.ryu", _ haveStory : Bool = true, postText : String) -> some View {
        
        
        VStack {
            ZStack {
                
                ReelContent {
                    
                    t.toggle()
                }
                
                
                if t {
                    Color.black.opacity(0.8)
                        
                    VStack(spacing: 16) {
                        HStack {
                            Image(systemName: "video.fill")
                            Text("Watch more reels")
                                .font(.system(size:13))
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 12)
                        .background(.white)
                        .cornerRadius(.infinity)
                        
                        Text("Watch again")
                            .font(.system(size:14))
                    }
                    .fontWeight(.medium)
                }
                
               

                
                HStack {
                    UserIcon(userIcon, userName, haveStory: haveStory)
                    
                    VStack(alignment: .leading) {
                        Text(userName)
                            .font(.system(size:14))
                            .fontWeight(.medium)
                        
                        Text("\(userName)݀ · Original audio")
                            .font(.system(size:12))
                    }
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                }
                .padding(.top , 4)
                .padding(.horizontal, 4)
                .offset(y: -156)
                
                
            }
            .frame(height: 350)
            
            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 22)
                    
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 21, height: 22)
                        .scaleEffect(CGSize(width: -1, height: 1))
                        .onTapGesture {
                            showStatus = .Comment
                        }
                    
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
                    
                    // UserIconGroup()
                    
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
                
                ExpanablePostText(userName: userName , postText: postText)
                
                Text("View all 5 comments")
                    .font(.system(size: 13.5))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Circle()
                        .frame(height: 25)
                        .foregroundColor(.black)
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 0.5)
                        }
                    
                    Text("Add a comment...")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 8)
                
                
                Text("29 minutes ago")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
            }
            .padding(.horizontal , 12)
            .padding(.top , 8)
        }
        .frame(maxWidth: .infinity)
    }
    
    
    @ViewBuilder
    func SponsoredImagePost(_ userIcon : String = "user3.jpg" , _ userName: String = "sumo.ryu", _ haveStory : Bool = true, postImageNames : [String] = ["posts1", "posts2"] , postText : String) -> some View {
        VStack {
            HStack {
                UserIcon(userIcon, userName, haveStory: haveStory)
                
                VStack(alignment: .leading) {
                    Text(userName)
                        .font(.system(size:14))
                        .fontWeight(.medium)
                    
                    Text("Sponsored")
                        .font(.system(size:12))
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.top , 4)
            .padding(.horizontal, 4)
            
            ZStack {
                if postImageNames.count > 1 {
                    TabView {
                        ForEach(postImageNames, id:\.hashValue) { i in
                            Image(i)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 393, height: 300)
                        }
                    }
                    .frame(height: 300)
                    .tabViewStyle(.page)
                    .cornerRadius(0)
                    
                } else {
                    Image(postImageNames[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 393, height: 300)
                        .cornerRadius(0)
                }
                
                HStack(alignment: .center) {
                    Text("Try Now")
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        
                }
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .offset(y: 135)
                
            }
            .cornerRadius(0)
        

            VStack(spacing: 4) {
                HStack(spacing: 12) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 22)
                    
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 21, height: 22)
                        .scaleEffect(CGSize(width: -1, height: 1))
                        .onTapGesture {
                            showStatus = .Comment
                        }
                    
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
                    
                   //  UserIconGroup()
                    
                    HStack(spacing: 4) {
                        Text("Followed by")
                        
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
                
                ExpanablePostText(userName: userName , postText: postText)
                
                
            }
            .padding(.horizontal , 12)
            .padding(.top , 8)
        }
        .frame(maxWidth: .infinity)
    }
   
    
}

extension View {
    @ViewBuilder
    func UserIcon(_ iconName : String , _ username : String, haveStory : Bool = false , isCloseFriend : Bool = false , width: CGFloat = 30, noRing : Bool = false) -> some View {
            
        AsyncImage(url: URL(string: iconName)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .cornerRadius(.infinity)
                .padding(4)
                .overlay {
                    
                    if !noRing {
                        if haveStory {
                           
                            if isCloseFriend {
                                Circle()
                                    .stroke( Color.green  , lineWidth: width > 45 ? 3 : 1.8)
                                
                            } else {
                                Circle()
                                    .stroke(  LinearGradient(colors: [.yellow, Color.mainColor], startPoint: .bottomLeading, endPoint: .topTrailing)  , lineWidth: width > 45 ? 3 : 1.8)
                               
                            }
                            
                        } else {
                            Circle()
                                .stroke(.gray , lineWidth: 1)
                                
                        }
                    }
                    
                   
                }

        } placeholder: {
            
        }

        
                
    }
}

struct ExpanablePostText : View {
    
    let userName : String
    let postText : String
    
    @State var isExpand : Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            
            if postText.count > 10 {
                if isExpand {
                    Text("**\(userName)** \(String(postText))" )
                } else {
                    let truncatedText = postText.prefix(10 * 3)
                    Text("**\(userName)** \(String(truncatedText))... " ) + Text("more").foregroundColor(.gray)
                }
            } else {
                Text("**\(userName)** \(postText)")
            }
            
        }
        .font(.system(size: 14))
        .frame(maxWidth: .infinity , alignment: .leading)
        .onTapGesture {
            isExpand = true
        }
    }
}


struct ReelContent : View {
    
    @State var player = AVPlayer()
    @State var playerItem = AVPlayerItem(url: Bundle.main.url(forResource: "a", withExtension: "mp4")!)
 
    let dismiss : () -> Void
    
    var body: some View {
        VStack {
            
            VideoPlayer(player: player)
                .frame(width: 393, height: 300)
                .scaledToFill()
                .onAppear {
                    player.replaceCurrentItem(with: playerItem)
                    player.play()
                    NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: playerItem, queue: .main) { _ in
                        dismiss()
                    }
                }
                
        }
        .onDisappear {
            player.pause()
            NotificationCenter.default.removeObserver(self)
        }
    }
}
struct MainPage_Previews: PreviewProvider {
    
    
    static var previews: some View {
        MainPage()
            
    }
}
