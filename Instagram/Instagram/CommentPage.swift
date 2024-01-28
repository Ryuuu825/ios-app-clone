//
//  CommentPage.swift
//  Instagram
//
//  Created by Ryu on 28/1/2024.
//

import SwiftUI
import Giffy

struct CommentPage: View {
    let postId : Int = 1
    
    @State var post : PostModel? = nil
    @State var comments : [UserComment] = []
    
    
    var body: some View {
        VStack {
            
            Color.clear.frame(height: 20)
            
            ZStack {
                Text("Comments")
                    .fontWeight(.semibold)
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 19, height: 22)
                    .rotationEffect(.degrees(25))
                    .offset(x: 160)
            }
            
            ScrollView(.vertical) {
                VStack(spacing: 12) {

                    ForEach(comments, id:\.id) { c in
                        
                            if c.type.elementsEqual("1") {
                                CommentRow(c: c , commentCtx: {
                                    AnyView(
                                        Text(c.value)
                                            .font(.system(size:14))
                                            .fontWeight(.regular)
                                    )
                                })
                            } else {
                                    
                                CommentRow(c: c , commentCtx: {
                                    AnyView(
                                        AsyncGiffy(url: URL(string: c.value)!) { phase in
                                            switch phase {
                                            case .loading:
                                                ProgressView()
                                            case .error:
                                                Text("Failed to load GIF")
                                            case .success(let giffy):
                                                giffy
                                                    
                                            }
                                        }
                                        .frame(width: 200, height: 150)
                                        .cornerRadius(1)
                                    )
                                })
                            }
                    }
                    

                }
                
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 8)) {
                Text("❤️")
                Text("🙌")
                Text("🔥")
                Text("👏")
                Text("😢")
                Text("😍")
                Text("😮")
                Text("😂")
            }
            .font(.system(size: 24))
            .padding(.horizontal, 8)
            
            HStack {
                Circle()
                    .frame(width: 30)
                    .foregroundColor(.black)
                
                HStack {
                    Text("Add a comment for sumo.ryu")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                    
                    Spacer()
                    
                    Text("GIF")
                        .font(.system(size: 12))
                        .bold()
                        .padding(.vertical, 4)
                        .padding(.horizontal, 2)
                        .overlay {
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(.white, lineWidth: 2)
                        }
                }
                .frame(width: 300)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(.gray, lineWidth: 0.6)
                }
            }
            .frame(height: 30)
            .padding(.top, 12)
        }
        .preferredColorScheme(.dark)
        .presentationDetents([.medium, .large])
        .onAppear {
            let url = URL(string: "http://localhost:5022/api/post/\(postId)")!
            URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r, _ in
                guard let d = d else { return }
                post = try? JSONDecoder().decode(PostModel.self, from: d)
                for id in post!.comments! {
                    let url2 = URL(string: "http://localhost:5022/api/usercomment/\(id.id)")!
                    URLSession.shared.dataTask(with: URLRequest(url: url2)) { d, r, _ in
                        guard let d2 = d else { return }
                        
                        let comment = try? JSONDecoder().decode(UserComment.self, from: d2)
                        comments.append(comment!)
                        
                    }.resume()
                }
            }.resume()
        }
        .onDisappear {
            // showStatus = .Nth
        }
    }
  
}


struct UserCommentComment : Codable {
    let user : UserModel?
    let value : String
    let type : String
    let date : String
    let id : Int
}


struct CommentRow : View {
    let c: UserComment
    let commentCtx :  () -> AnyView
    
    @State var cc : [UserCommentComment] = []
    @State var expandCC : Bool = false
    
    init(c: UserComment , commentCtx : @escaping () -> AnyView) {
        self.commentCtx = commentCtx
        self.c = c
    }
    
    var body : some View {
        HStack(alignment: .top) {
            
            UserIcon(c.user!.icon, "", width: 24)
            
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    Text(c.user!.name)
                        .fontWeight(.semibold)
                        
                    Text(DF.sinceTimeString(str: c.date))
                        .fontWeight(.light)
                        .font(.system(size:11))
                    
                }
                .font(.system(size:13))
                
                
                commentCtx()
                
                
                Text("Reply")
                    .font(.system(size:12))
                    .foregroundColor(.gray)
                    .offset(y: 5)
            
                
                if c.comments != nil {
                    
                    if c.comments!.count > 0 && !expandCC {
                        HStack {
                            
                            Rectangle()
                                .frame(width: 22 , height: 0.6)
                                .foregroundColor(.gray)
                            
                            Text("View 7 more replies")
                                .font(.system(size:12))
                                .foregroundColor(.gray)
                                .padding(.top , 1)
                                
                        }
                        .onTapGesture {
                            expandCC = true
                        }
                    }
                    
                    let cc = c.comments!
                    
                    if expandCC {
                        ForEach(cc, id:\.id) { comment in
                            
                            if c.type.elementsEqual("1") {
                                CommentCRow(c: comment.id , commentCtx: {
                                    AnyView(
                                        Text(comment.value)
                                            .font(.system(size:14))
                                            .fontWeight(.regular)
                                    )
                                })
                                
                            } else {
                                    
                                CommentCRow(c: comment.id , commentCtx: {
                                    AnyView(
                                        AsyncGiffy(url: URL(string: comment.value)!) { phase in
                                            switch phase {
                                            case .loading:
                                                ProgressView()
                                            case .error:
                                                Text("Failed to load GIF")
                                            case .success(let giffy):
                                                giffy
                                                    
                                            }
                                        }
                                        .frame(width: 200, height: 150)
                                        .cornerRadius(1)
                                    )
                                })
                                .frame(maxWidth: .infinity)
                            }
                                  
                                
                        }
                    }
                }
                
            }
            
            
            Spacer()
            
            VStack(spacing: 8) {
                Image(systemName: "heart")
                    .font(.system(size:16))
                
                Text(String("1"))
                    .font(.system(size:11))
            }
            .padding(.vertical , 12)
            
        }
        .padding(.horizontal, 12)
    }
}

struct CommentCRow : View {
    let c: Int
    let commentCtx :  () -> AnyView
    
    @State var commentc : UserCommentComment? = nil
    
    init(c: Int , commentCtx : @escaping () -> AnyView) {
        self.commentCtx = commentCtx
        self.c = c
    }
    
    var body : some View {
        VStack {
            
                
            if commentc != nil && commentc!.user != nil {
           
                HStack(alignment: .top) {
                    
                    UserIcon(commentc!.user!.icon, "", width: 16)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 4) {
                            Text(commentc!.user!.name)
                                .fontWeight(.semibold)
                                
                            Text(DF.sinceTimeString(str: commentc!.date))
                                .fontWeight(.light)
                                .font(.system(size:11))
                            
                        }
                        .font(.system(size:13))
                        
                        
                        commentCtx()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Reply")
                            .font(.system(size:12))
                            .foregroundColor(.gray)
                            .offset(y: 5)

                    }
                    
                    
                    VStack(spacing: 8) {
                        Image(systemName: "heart")
                            .font(.system(size:16))
                        
                        Text(String("1"))
                            .font(.system(size:11))
                    }
                    .padding(.vertical , 12)
                    .offset(x: 28)
                    
                }
                .frame(maxWidth: .infinity)
                
            }
        }
        .frame(maxWidth: .infinity)
       
        .onAppear {
            let url = URL(string: "http://localhost:5022/api/usercommentcomment/\(c)")!
            URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r, _ in
                guard let d = d else { return }
                commentc = try? JSONDecoder().decode(UserCommentComment.self, from: d)
            }.resume()
            
        }
            
       
    }
}
struct CommentPage_Previews: PreviewProvider {
    static var previews: some View {
        CommentPage()
    }
}
