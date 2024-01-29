//
//  CreateStoryPage.swift
//  Instagram
//
//  Created by Ryu on 29/1/2024.
//

import SwiftUI

struct CreateStoryPage: View {
    @State var scale : CGFloat = 1
    @State var moveX : CGFloat = 0
    @State var moveY : CGFloat = 0
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                DynamicBackgroundColor("story" , width: proxy.size.width, height: proxy.size.height - 60 )
            }
            .cornerRadius(24)
            
            Image("story")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .scaleEffect(x: scale,y: scale)
                .offset(x: moveX, y: moveY)
                .gesture(
                    DragGesture()
                    .onChanged({ v in
                        self.moveX = v.translation.width
                        self.moveY = v.translation.height
                        
                    }).simultaneously(with: MagnificationGesture()
                        .onChanged({ v in
                            scale = v
                        }))
                )
            
            HStack {
                HStack {
                    
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(.black)
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                        }
                    
                    Color.clear.frame(width: 10, height: 1)
                    
                    Text("Your story")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                    
                    Color.clear.frame(width: 5, height: 1)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(.infinity)
                
                HStack {
                    
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundColor(.green)
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                            }
                        
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                    }
                    
                    Color.clear.frame(width: 5, height: 1)
                    
                    Text("Close friends")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                    
                    Color.clear.frame(width: 5, height: 1)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(.infinity)
                
                ZStack {
                    Circle()
                        .frame(width: 40)
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.black)
                        .bold()
                }
            }
            .frame(maxWidth: .infinity)
            .offset(y: 350)
            
            HStack {
                Image(systemName: "chevron.left")
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(.thickMaterial)
                    .cornerRadius(.infinity)
                
                Spacer()
                
                Image(systemName: "textformat")
                    .frame(width: 40, height: 40)
                    .background(.thickMaterial)
                    .cornerRadius(.infinity)
                
                Image(systemName: "smiley")
                    .frame(width: 40, height: 40)
                    .background(.thickMaterial)
                    .cornerRadius(.infinity)
                
                Image(systemName: "music.note")
                    .frame(width: 40, height: 40)
                    .background(.thickMaterial)
                    .cornerRadius(.infinity)
                
                Image(systemName: "wand.and.stars")
                    .frame(width: 40, height: 40)
                    .background(.thickMaterial)
                    .cornerRadius(.infinity)
                
                Image(systemName: "ellipsis")
                    .frame(width: 40, height: 40)
                    .background(.thickMaterial)
                    .cornerRadius(.infinity)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .offset(y: -350)

        }
        .preferredColorScheme(.dark)
    }
}

struct CreateStoryPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateStoryPage()
    }
}
