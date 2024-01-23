//
//  ProfilePage.swift
//  Instagram
//
//  Created by Ryu on 21/1/2024.
//

import SwiftUI
import AVKit


struct Helper {
    static func getPreviewImage(forURL url: URL, atSeconds seconds: Double) -> UIImage? {
        let asset = AVURLAsset(url: url)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        
        let timestamp = CMTime(seconds: seconds, preferredTimescale: 100)
        
        do {
            let imageRef = try generator.copyCGImage(at: timestamp, actualTime: nil)
            return UIImage(cgImage: imageRef)
        }
        catch let error as NSError
        {
            print("Image generation failed with error \(error)")
            return nil
        }
    }
}
struct ProfilePage: View {
    var body: some View {
        VStack {
            
            Header()
            
            ScrollView {
                VStack(spacing: 0) {
                    VStack(spacing: 12) {
                        
                        HStack {
                            
                            UserIcon()
                            
                            Spacer()
                            
                            UserStat()
                        }
                        
                        
                        // User Bio
                        Text("祝君安好")
                            .font(.system(size:14))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                        // CTA
                        HStack {
                            Text("Edit profile")
                                .frame(width: 155, height: 35)
                                .background {
                                    Color(uiColor: .secondarySystemBackground)
                                }
                                .cornerRadius(8)
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                            
                            Text("Share profile")
                                .frame(width: 155, height: 35)
                                .background {
                                    Color(uiColor: .secondarySystemBackground)
                                }
                                .cornerRadius(8)
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                            
                            Image(systemName: "person.badge.plus")
                                .frame(width: 40, height: 35)
                                .background {
                                    Color(uiColor: .secondarySystemBackground)
                                }
                                .cornerRadius(8)
                        }
                        .padding(.top , 12)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 22) {
                                
                                HighLight("highlight1" , "多士")
                                HighLight("posts2" , "JP")
                                HighLight("user3" , "gym")
                                
                            }
                            
                        }
                        .padding(.vertical , 8)
                        
                        
                    }
                    .padding(.horizontal , 12)
                    
                    HStack {
                        GeometryReader { proxy in
                            HStack {
                                VStack {
                                    Image(systemName: "squareshape.split.3x3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 23)
                                    Rectangle()
                                        .frame(height: 1)
                                }
                                .frame(width: proxy.size.width / 3)
                                
                                VStack {
                                    Image(systemName: "video")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 19)
                                    Rectangle()
                                        .frame(height: 1)
                                        .hidden()
                                    
                                }
                                .frame(width: proxy.size.width / 3)
                                
                                
                                VStack {
                                    Image(systemName: "person")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 22)
                                    
                                    Rectangle()
                                        .frame(height: 1)
                                        .hidden()
                                }
                                .frame(width: proxy.size.width / 3)
                            }
                        }
                    }
                    .frame(height: 33)
                    .padding(.top , 8)
                    
                   
                        
                    GeometryReader { proxy in
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 3) {
                            
                            ImagesPostThumbmail(imageName: "myposts1")
                            ImagesPostThumbmail(imageName: "posts2")
                            
                           
                            VideosPostThumbnail(videoName: "test")
                            VideosPostThumbnail(videoName: "IMG_7201" , videoExtension: "MOV")
                            
                            ImagesPostThumbmail(imageName: "myposts2")
                            
                            
                        }
                    }
                    
                    
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

extension ProfilePage {
    
    @ViewBuilder
    func Header() -> some View {
        HStack(alignment: .center) {
            
            HStack {
                Image(systemName: "lock")
                
                Text("sumo_ryu")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                
                Image(systemName: "chevron.down")
                    .font(.system(size: 12))
                    .offset(y: 4)
                
            }
            
            Spacer()
            
            HStack(spacing: 24) {
                Image(systemName: "plus")
                    .padding(2)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white , lineWidth: 2)
                    }
                
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 22 , height: 18)
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func UserIcon() -> some View {
        ZStack {
            Image("user2")
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(.infinity)
            
            Image(systemName: "plus")
                .fontWeight(.medium)
                .padding(4)
                .background {
                    Circle()
                        .foregroundColor(.blue)
                }
                .offset(x: 30, y: 25)
        }
    }
    
    @ViewBuilder
    func UserStat() -> some View {
        HStack(spacing: 24) {
            
            VStack {
                Text("5")
                    .fontWeight(.bold)
                
                Text("Posts")
            }
            
            VStack {
                Text("249")
                    .fontWeight(.bold)
                
                Text("Followers")
            }
            
            VStack {
                Text("681")
                    .fontWeight(.bold)
                
                Text("Following")
            }
            
        }
        .font(.system(size: 16))
        .fontWeight(.medium)
    }
    
    @ViewBuilder
    func HighLight(_ imgName : String , _ name : String) -> some View {
        VStack {
            Image(imgName)
                .resizable()
                .frame(width: 60 , height: 60)
                .cornerRadius(.infinity)
                .padding(4)
                .overlay {
                    Circle()
                        .stroke(.gray, lineWidth: 1)
                }
                .frame(width: 70 , height: 70)
            
            Text(name)
                .font(.system(size: 14))
                .fontWeight(.medium)
        }
    }
    
    @ViewBuilder
    func ImagesPostThumbmail(imageName : String, _ width : CGFloat = 131) -> some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                
                
            ZStack {
                
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.white , lineWidth: 1.5)
                    .frame(width: 15 , height: 15)
                
                
                Rectangle()
                    .frame(width: 15 , height: 15)
                    .cornerRadius(4)
                    .offset(x: -3 , y: -3)
                
            }
            .offset(x: 45, y: -45)
        }
        .frame(width: width , height: width )
        .cornerRadius(1)
    }
    
    @ViewBuilder
    func VideosPostThumbnail(videoName : String, videoExtension : String = "mp4", _ width: CGFloat = 131) -> some View {
        ZStack {
            Image(uiImage: Helper.getPreviewImage(forURL: Bundle.main.url(forResource: videoName, withExtension: videoExtension)!, atSeconds: 0)!)
                .resizable()
                
            
            Image(systemName: "video.fill")
                .offset(x: 45, y: -45)
        }
        .frame(width:width, height: width)
        .cornerRadius(0)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
