//
//  StoryPage.swift
//  Instagram
//
//  Created by Ryu on 21/1/2024.
//

import SwiftUI
import AVFoundation
import AVKit

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

extension View {
    @ViewBuilder
    func DynamicBackgroundColor(_ imageName : String, width: CGFloat , height: CGFloat) -> some View {
        
        let uiImage : UIImage = UIImage(imageLiteralResourceName: imageName)
       
        LinearGradient(colors: [Color(uiImage.averageColor!).opacity(0.5) , Color(uiImage.averageColor!)], startPoint: .top, endPoint: .bottom)
            .frame(width: width , height: height)
            .cornerRadius(12)
            .offset(y: -10)
        
        
    }
}


struct DummyStory1 : View {
    
    
    var body : some View {
        GeometryReader { proxy in
            
            DynamicBackgroundColor("story1" , width: proxy.size.width, height: 710)
            
            ZStack {
                Image("story1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                
                HStack {
                    Image(systemName: "mappin")
                    Text("熊本城")
                }
                .padding(.horizontal,4)
                .padding(.vertical,2)
                .background(.black)
                .cornerRadius(4)
                .offset(x: 130 , y: 120)
                
            }
            
            
            
        }
    }
    
}

struct DummyStory2: View  {
    
    var body: some View {
        GeometryReader { proxy in
            
            
            self.DynamicBackgroundColor("posts1" , width: proxy.size.width, height: 710)
            
            VStack(spacing: 0) {
                HStack(spacing:0) {
                    Image("user1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .cornerRadius(.infinity)
                        .padding(4)
                    
                    Text("whiz_cat")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 4)
                .padding(.vertical, 4)
                
                Image("posts1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width-50, height: 300)
                    .background(.black)
                
                Text("**sumo.ryu** I have no enemies")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .font(.system(size: 14))
                
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(12)
            .padding()
            .offset(y: 150)

            
        }
    }
    
}

struct DummyStory3: View  {
    
    var body: some View {
           
        GeometryReader { proxy in
            
            DynamicBackgroundColor("posts1" , width: proxy.size.width, height: 710)
            
            
            VStack(spacing: 0) {
                
                
                Image("posts1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 300)
                    .cornerRadius(0)
                    .background(.white)
                
                Text("@whiz_cat")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .foregroundColor(.white)
                
            }
            .padding()
            .offset(y: 200)

            
        }
        
    }
    
}

struct DummyStory4: View  {
    
    @State var player : AVPlayer = AVPlayer()
    
    // the timer
    static let time : TimeInterval = 1 // 0.1 sec
    static let storyAllowTime = 5 // 50 * 0.1 = 5 sec
    // the timer
    @State var timeLeft = storyAllowTime
    @State var timer = Timer.publish(every: time, on: .main, in: .common).autoconnect()
    
    var body: some View {
           
        GeometryReader { proxy in
            
            
            VStack(spacing: 4) {
                ZStack {
                    
                    ZStack {
                        VideoPlayer(player: player)
                           
                            
                        
                        Color.black.opacity(0.1)
                            .frame(width: 300, height: 350)
                    }
                    
                    HStack {
                        Image(systemName: "video.fill")
                        
                        Spacer()
                        
                        Text(String(format: "0:%02d" , timeLeft))
                            .onReceive(timer) { _ in
                                if timeLeft > 0 {
                                    timeLeft -= 1
                                } else {
                                    timeLeft = 5
                                }
                            }
                        
                    }
                    .offset(y: -200)
                }
                .background(.gray)
                .frame(width: 300, height: 350)
                
                
                Text("@sumo.ryu")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .frame(maxWidth: 300, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    

        }
        .onAppear {
            player = AVPlayer(url: Bundle.main.url(forResource: "a", withExtension: "mp4")!)
            player.play()
            timeLeft = 5
        }
        
    }
    
}

struct DummyStory5: View  {
    
    @State var scaleEffectValue : CGFloat = 0
    
    var body: some View {
           
        GeometryReader { proxy in
            
            DynamicBackgroundColor("myposts1" , width: proxy.size.width, height: 710)
            
            Image("myposts1")
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 700)
                .cornerRadius(0)
            
            Text("@sandwich_cat.hk".uppercased())
                .foregroundColor(Color.mainColor)
                .fontWeight(.medium)
                .frame(height: 30)
                .padding(.vertical , 2)
                .padding(.horizontal , 8)
                .background(.white)
                .cornerRadius(4)
                .rotationEffect(.degrees(5))
                .offset(x: 50 , y: 500)
            
            VStack {
                Text("Sleeping cat")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 2)
                        .cornerRadius(.infinity)
                    
                    Text("😍")
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .scaleEffect(scaleEffectValue)
                        .animation(.spring() , value: scaleEffectValue)
                        .onAppear {
                            scaleEffectValue = 1
                        }
                        
                }
                .frame(width: 100)
            }
            .padding(.vertical , 12)
            .frame(width: 150)
            .background(.white)
            .cornerRadius(4)
            .rotationEffect(.degrees(5))
            .offset(x: 70 , y: 410)
            
            
            
        }
        
    }
    
}




struct StoryPage: View {
    
    // storys
    let bodyCtxs : [AnyView] = [AnyView(DummyStory1()) , AnyView(DummyStory2()), AnyView(DummyStory3()), AnyView(DummyStory4()) , AnyView(DummyStory5())]
//    let bodyCtxs : [AnyView] = [AnyView(DummyStory5()) ]
    @State var currentStoryIndex : Int = 0
    
    
    static let time : TimeInterval = 0.1 // 0.1 sec
    static let storyAllowTime = 50 // 50 * 0.1 = 5 sec
    // the timer
    @State var timeLeft = storyAllowTime
    @State var timer = Timer.publish(every: time, on: .main, in: .common).autoconnect()
    
    let dismiss : () -> Void
    
    var body: some View {
        
    
        ZStack {

            // Story Content
            bodyCtxs[currentStoryIndex]
                .onReceive(timer) { r in
                    if timeLeft <= 0 {
                        // timeLeft = StoryPage.storyAllowTime
                        // currentStoryIndex = (currentStoryIndex + 1) % bodyCtxs.count
                        dismiss()
                    } else {
                        timeLeft -= 1
                    }
                }
            
            HStack {
                GeometryReader { proxy in
                    Color.black.opacity(0.05)
                        .frame(width: proxy.size.width / 2, height: proxy.size.height)
                        .onTapGesture {
                            timeLeft = StoryPage.storyAllowTime
                            
                            
                            if (currentStoryIndex > 0 ) {
                                currentStoryIndex = (currentStoryIndex - 1) % bodyCtxs.count
                            } else {
                                currentStoryIndex = 0
                            }
                        }
                    
                    Color.black.opacity(0.05)
                        .frame(width: proxy.size.width / 2, height: proxy.size.height)
                        .offset(x: proxy.size.width / 2)
                        .onTapGesture {
                            timeLeft = StoryPage.storyAllowTime
                            currentStoryIndex = (currentStoryIndex + 1) % bodyCtxs.count
                            if (currentStoryIndex == 0) {
                                dismiss()
                            }
                        }
                    
                    
                    
                }
            }

            // The Information Bar on the top
            VStack(spacing: 6) {
                HStack(spacing:4) {
                    ForEach(0..<bodyCtxs.count) { i in

                        ZStack {
                            let color : Color = currentStoryIndex != i ? (currentStoryIndex > i ? Color.white : Color.gray) : .gray
                            let length : Int = 360 / (bodyCtxs.count)
                            let plength : Int = ( length / StoryPage.storyAllowTime ) * (StoryPage.storyAllowTime - timeLeft)

                            Rectangle()
                                .frame(width: 360 / CGFloat(bodyCtxs.count), height:2)
                                .cornerRadius(.infinity)
                                .foregroundColor(color)

                            if currentStoryIndex == i {
                                Rectangle()
                                    .frame(width: CGFloat(plength), height:2 )
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .cornerRadius(.infinity)
                                    .foregroundColor(.white)
                                    .animation(.spring(), value: plength)
                            }

                        }
                        .frame(width: 360 / CGFloat(bodyCtxs.count), height:2)


                    }
                }

                HStack {
                    Image("user2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .cornerRadius(.infinity)
                        .padding(4)

                    VStack(alignment: .leading) {
                        HStack {
                            Text("sumo.ryu")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)

                            Text("3m")
                                .foregroundColor(.white)
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
                    
                    HStack(spacing: 1) {
                        Image(systemName: "star.fill")
                        Image(systemName: "chevron.down")
                            .font(.system(size: 12))
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical , 4)
                    .background(Color(red: 0.003166666953, green: 0.8347119689, blue: 0.2053279579))
                    .cornerRadius(8)
                    
                    Image(systemName: "ellipsis")
                    Image(systemName: "xmark")
                        .font(.system(size: 28))

                }
                .padding(.horizontal,4)
            }
            .offset(y: -350)

            // The bottom interactive bar
            HStack {
                Text("Send message")
                    .padding(.horizontal , 22)
                    .padding(.vertical , 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay {
                        RoundedRectangle(cornerRadius: .infinity)
                            .strokeBorder(.gray , lineWidth: 1)

                    }

                Color.clear
                    .frame(width: 12)


                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 25, height: 22)

                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 24, height: 22)
                    .rotationEffect(.degrees(25))
                    .offset(y:-2)
            }
            .frame(maxWidth: .infinity)
            .offset(y: 360)
            .padding(.horizontal,12)

        }
        .preferredColorScheme(.dark)
    }
    
}



struct StoryPage_Previews: PreviewProvider {
    static var previews: some View {
        StoryPage {
            
        }
            
    }
}
