//
//  PrivateMessagePage.swift
//  Instagram
//
//  Created by Ryu on 26/1/2024.
//

import SwiftUI


extension Color {
    // #colorLiteral(, alpha: 1)
    static let MessageColor : Color = Color(red: 0.4559624195, green: 0.2728477716, blue: 0.9215835929)
    static let MessageColor2 : Color = Color(red: 0.149019599, green: 0.149019599, blue: 0.149019599)
    static let MessageColor3 : Color = Color(red: 0.1960422695, green: 0.4239244163, blue: 0.9181428552)
    static let ReplyMessageColor : Color = Color(red: 0.1559624195, green: 0.0728477716, blue: 0.4215835929)
}
struct PrivateMessagePage: View {
    var body: some View {
        ZStack {
            VStack(spacing:0) {
                HStack {
                    Image(systemName: "chevron.left")
                    Image("user2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .cornerRadius(.infinity)
                        .padding(4)
                        
                    VStack(alignment: .leading) {
                        Text("Ryu 🇭🇰🇯🇵")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        
                        Text("sumo.ryu")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "phone")
                    Image(systemName: "video")
                    
                }
                .font(.system(size: 22))
                .padding(.horizontal, 12)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        
            
                        VStack(alignment: .trailing, spacing: 4) {
                            VStack {
                                Text("You replied")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                                
                                HStack {
                                    ZStack {
                                        
                                        Image("posts1")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 70)
                                        
                                        Text("Training back because i want her back")
                                            .font(.system(size: 8))
                                            .offset(y:-50)
                                        
                                        Text("(Real)")
                                            .font(.system(size: 8))
                                            .offset(y:50)
                                        
                                        Text("(I miss her smile)")
                                            .font(.system(size: 8))
                                            .offset(y:60)
                                            
                                    }
                                    .frame(width: 100, height: 170)
                                    .cornerRadius(0)
                                    
                                    Rectangle()
                                        .frame(width: 5)
                                        .cornerRadius(.infinity)
                                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                }
                            }
                            Text("Bro")
                                .padding(.vertical , 12)
                                .padding(.horizontal , 12)
                                .background(Color.MessageColor)
                                .cornerRadius(24)
                            
                            Text("So depressed in these few days")
                                .padding(.vertical , 12)
                                .padding(.horizontal , 12)
                                .background(Color.MessageColor)
                                .cornerRadius(24)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            VStack {
                                Text("You replied")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                                
                                HStack {
                                    ZStack {
                                        
                                        Image("posts2")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 70)
                                        
                                        Text("I don't want to work. I want to raise sheepp with my homie")
                                            .font(.system(size: 6))
                                            .offset(y:-50)
                                            .foregroundColor(.black)
                                        
                                       
                                            
                                    }
                                    .frame(width: 100, height: 170)
                                    .background(.white)
                                    .cornerRadius(12)
                                    
                                    Rectangle()
                                        .frame(width: 5)
                                        .cornerRadius(.infinity)
                                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                }
                            }
                            Text("True")
                                .padding(.vertical , 12)
                                .padding(.horizontal , 12)
                                .background(Color.MessageColor)
                                .cornerRadius(24)
                            
                            Text("0 motivation abt life")
                                .padding(.vertical , 12)
                                .padding(.horizontal , 12)
                                .background(Color.MessageColor)
                                .cornerRadius(24)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        HStack(alignment: .bottom) {
                            
                            Image("user2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .cornerRadius(.infinity)
                                .padding(4)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                VStack(alignment: .leading) {
                                    Text("Replied to you")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14))
                                    
                                    HStack {
                                        
                                        Rectangle()
                                            .frame(width: 5)
                                            .cornerRadius(.infinity)
                                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                        
                                        Text("So depressed in these few days")
                                            .padding(.vertical , 12)
                                            .padding(.horizontal , 12)
                                            .background(Color.ReplyMessageColor)
                                            .cornerRadius(24)
                                            .font(.system(size: 14))
                                    }
                                    
                                }
                                .padding(.bottom, 8)
                                
                                Text("What happen bro ??")
                                    .padding(.vertical , 12)
                                    .padding(.horizontal , 12)
                                    .background(Color.MessageColor2)
                                    .cornerRadius(24)
                                
                               
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.leading, 12)
                        
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            ForEach(1..<4, id:\.hashValue) { _ in
                                HStack {
                                    Image(systemName: "play.fill")
                                    
                                    HStack(spacing: 3) {
                                        ForEach(1..<30, id: \.hashValue) { i in
                                            Rectangle()
                                                .frame(width: 3, height: CGFloat.random(in: 5..<35))
                                                .cornerRadius(.infinity)
                                        }
                                    }
                                    
                                    Text("0:05")
                                        .font(.system(size: 12))
                                        .bold()
                                }
                                .padding(.vertical , 16)
                                .padding(.horizontal , 20)
                                .background(Color.MessageColor)
                                .cornerRadius(24)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                        }
                        
     
                        HStack(alignment: .bottom) {
                            
                            Image("user2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .cornerRadius(.infinity)
                                .padding(4)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                
                                
                                Text("Damn")
                                    .padding(.vertical , 12)
                                    .padding(.horizontal , 12)
                                    .background(Color.MessageColor2)
                                    .cornerRadius(24)
                                
                                Text("I'll send you my ball pic as consolation")
                                    .padding(.vertical , 12)
                                    .padding(.horizontal , 12)
                                    .background(Color.MessageColor2)
                                    .cornerRadius(24)
                               
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.leading, 12)
                        
                        HStack(alignment: .bottom) {
                            
                            Image("user2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .cornerRadius(.infinity)
                                .padding(4)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                
                                
                                HStack {
                                    Image(systemName: "play.fill")
                                    Text("Photo")
                                }
                                .foregroundColor(Color.gray)
                                .padding(.vertical , 12)
                                .padding(.horizontal , 16)
                                .background(Color.MessageColor2)
                                .cornerRadius(24)
                               
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.leading, 12)
                        
                        VStack(alignment: .trailing, spacing: 4) {
                           
                            Text("Hell no")
                                .padding(.vertical , 12)
                                .padding(.horizontal , 12)
                                .background(Color.MessageColor)
                                .cornerRadius(24)

                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                            
                        
                    }
                    .fontWeight(.regular)
                }
                .frame(maxWidth: .infinity)
                
                
                Color.clear.frame(height: 60)
            }
            .frame(height: 790)
            
            
            HStack(alignment: .center) {
                Image(systemName: "camera.fill")
                    .padding(4)
                    .padding(.vertical, 4)
                    .background(Color.MessageColor3)
                    .cornerRadius(.infinity)
                    
                Text("Message...")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                
                Spacer()
                
                Image(systemName: "mic")
                Image(systemName: "photo")
                Image(systemName: "smiley")
            }
            .font(.system(size: 22))
            .frame(maxWidth: .infinity, maxHeight: 20)
            .padding(.trailing)
            .padding(.leading, 8)
            .padding(.vertical, 12)
            .background(.thinMaterial)
            .cornerRadius(.infinity)
            .padding(.horizontal, 12)
            .offset(y: 370)
            
        }
        .preferredColorScheme(.dark)
    }
}

struct PrivateMessagePage_Previews: PreviewProvider {
    static var previews: some View {
        PrivateMessagePage()
    }
}

