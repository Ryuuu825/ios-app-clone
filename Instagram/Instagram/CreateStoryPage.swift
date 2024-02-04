//
//  CreateStoryPage.swift
//  Instagram
//
//  Created by Ryu on 29/1/2024.
//

import SwiftUI

struct DragableCompoment<T: View> : View {
    let ctx : () -> T
    
    
    @State var scale : CGFloat = 1
    @State var moveX : CGFloat = 0
    @State var moveY : CGFloat = 0
    
    @State var displayed : Bool = true // lazy to delete from the array
    @State var displayBin : Bool = false
    
    
    init(ctx: @escaping () -> T) {
        self.ctx = ctx
    }
    
    var body : some View {
        ZStack {
            ctx()
                .opacity(displayed ? 1 : 0)
                .scaleEffect(scale)
                .offset(x: moveX, y: moveY)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ v in
                            scale = v * 0.9
                        }).simultaneously(with: DragGesture().onChanged({ v in
                            
                            displayBin = true
                            
                            if ( (v.location.x >= 30 && v.location.x <= 80) &&
                                 (v.location.y >= 280 && v.location.x <= 320)
                            ) {
                                scale = 0.5
                            } else {
                                scale = 1
                            }
                            
                            moveX = v.location.x - 50
                            moveY = v.location.y - 50
                        }).onEnded({ v in
                            displayBin = false
                            if ( (v.location.x >= 30 && v.location.x <= 80) &&
                                 (v.location.y >= 280 && v.location.x <= 320)
                            ) {
                                displayed = false
                                
                            }
                        }))
                )
                .animation(.interactiveSpring(), value: scale)
            
            // y: 300 , x: 47 , hard coded :)
            Image(systemName: "bin.xmark")
                .padding(12)
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 1)
                }
                .opacity(displayBin ? 1 : 0)
                .animation(.easeInOut, value: displayBin)
                .offset(y: 250)
                
        }
        .foregroundColor(.white)
        .frame(height: 759 , alignment: .center)
        .frame(maxWidth: .infinity)
    }
}

struct Wheel: View {
    
    
    let gradient : Gradient = {
        Gradient(colors:
            Array(0...255).map {
                Color(hue:Double($0)/255 , saturation: 1, brightness: 1)
            }
        )
    }()
 
    var body: some View {
        ZStack {
            Circle()
                .fill(AngularGradient(  gradient : gradient, center: .center) )
                .overlay(
                   Circle()
                    .strokeBorder(Color.white,lineWidth: 2)
                )
        }
     }
}


struct CreateStoryPage: View {
    
    @State var showAddText : Bool = false
    @State var text : String = ""
    @FocusState var focusOnKb : Int?
    
    @State var showPreMusic : Bool = false
    @State var showMusic : Bool = false
    
    @State var moveX : CGFloat = 0

    @State var componment : [AnyView] = [
        AnyView(
            Image("story")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)),
        AnyView(
            Image("highlight1")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .cornerRadius(.infinity))
    ]
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                DynamicBackgroundColor("story" , width: proxy.size.width, height: proxy.size.height - 60 )
                
                ZStack {
                    
                    ForEach(componment.indices , id:\.hashValue) { i in
                        DragableCompoment {
                            componment[i]
                        }
                    }
                    
                }
                
                Color.black.frame(height: 70)
                    .offset(y: proxy.size.height - 70)
            }
            .cornerRadius(24)
            
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
                    .onTapGesture {
                        showAddText = true
                    }
                
                Image(systemName: "smiley")
                    .frame(width: 40, height: 40)
                    .background(.thickMaterial)
                    .cornerRadius(.infinity)
                
                Image(systemName: "music.note")
                    .frame(width: 40, height: 40)
                    .background(.thickMaterial)
                    .cornerRadius(.infinity)
                    .onTapGesture {
                        showPreMusic = true
                    }
                
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
            
           
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        if !text.isEmpty  {
                            print("Adding \(text)")
                            componment.append(AnyView(Text(text).bold().padding(.vertical, 8).padding(.horizontal).background(.gray).foregroundColor(.black).cornerRadius(12)))
                        }
                        showAddText = false
                    }
                
                VStack {

                    HStack {
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 20, height: 300)
                                .foregroundColor(.gray)
                                .rotationEffect(.degrees(3))
                            
                            Circle()
                                .frame(width: 25)
                                .offset(x: 5)
                        }
                        .offset(x: -15)
                        
                        TextField("" , text: $text)
                            .focused($focusOnKb, equals: 1)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    self.focusOnKb = 1
                                }
                            }
                            .frame(height: 100)
                    }
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(0)
                    
                        
                }
                .frame(height: 500)
                .ignoresSafeArea(.keyboard, edges: .bottom)
                
                
            }
            .ignoresSafeArea()
            .opacity(showAddText ? 1 : 0)
            .animation(.easeInOut(duration: 0.2), value: showAddText)
                
            
            
          
            ZStack {
                Color.black.opacity(0.93)
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        Spacer()
                        
                        HStack(spacing: 24) {
                            Image("posts1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .background {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 35, height: 35)
                                        .cornerRadius(4)
                                }
                            
                            Wheel()
                                .frame(width: 30)
                            
                            Image(systemName: "person")
                                .padding(6)
                                .background {
                                    LinearGradient(colors: [.MessageColor, .mainColor], startPoint: .leading, endPoint: .trailing)
                                        .cornerRadius(.infinity)
                                        .overlay {
                                            Circle()
                                                .stroke(.white, lineWidth: 2)
                                        }
                                }
                        }
                        .padding(.leading, 12)
                        
                        Spacer()
                        
                        Text("Done")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.trailing, 12)
                            .onTapGesture {
                                showMusic = false
                                componment.append(AnyView( HStack {
                                    Image("posts1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(0)
                                        
                                    VStack(alignment: .leading) {
                                        Text("Aruarian Dance")
                                            .fontWeight(.semibold)
                                        
                                        Text("mono._, Shilou., hirarth vibe")
                                    }
                                    .font(.system(size: 14))
                                    
                                }
                                .padding(4)
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(4)))
                            }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image("posts1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(0)
                            
                        VStack(alignment: .leading) {
                            Text("Aruarian Dance")
                                .fontWeight(.semibold)
                            
                            Text("mono._, Shilou., hirarth vibe")
                        }
                        .font(.system(size: 14))
                        
                    }
                    .padding(4)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(4)
                    
                    Spacer()
                    
                    VStack {
                        HStack(spacing: 12) {
                            Image(systemName: "xmark")
                                .font(.system(size: 8))
                                .padding(4)
                                .overlay {
                                    Circle()
                                        .stroke(.white, lineWidth: 1)
                                }
                            
                            HStack(spacing: 2) {
                                Rectangle()
                                    .frame(width: 10 , height: 10)
                                    .cornerRadius(2)
                                
                                Rectangle()
                                    .frame(width: 3 , height: 8)
                                    .cornerRadius(4)
                            }
                            .foregroundColor(Color.mainColor)
                            .padding(10)
                            .padding(.vertical, 2)
                            .background(.white)
                            .cornerRadius(.infinity)
                            
                            VStack(spacing: 2) {
                                Rectangle()
                                    .frame(width: 10 , height: 10)
                                    .cornerRadius(2)
                                
                                Rectangle()
                                    .frame(width: 8 , height: 3)
                                    .cornerRadius(4)
                            }
                            
                        }
                        .font(.system(size: 14))
                        
                        HStack(spacing: 24) {
                            Text("15")
                                .font(.system(size: 14))
                                .padding(8)
                                .overlay {
                                    Circle()
                                        .stroke(.white, lineWidth: 1.5)
                                    
                                }
                            
                            ZStack{
                                Rectangle()
                                    .frame(width: 200, height: 1)
                                    .foregroundColor(.gray)
                                
                                Rectangle()
                                    .frame(width: 50, height: 2)
                                    .foregroundColor(.white)
                                
                                Circle()
                                    .frame(width: 8)
                                    .foregroundColor(Color.mainColor)
                                    .offset(x: -80)
                            }
                            
                            
                            ZStack {
                                Circle()
                                    .frame(width: 30)
                                
                                Rectangle()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        
                        ZStack {
                            
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                
                                                                
                                HStack {
                                    GeometryReader { proxy in
                                        Color.clear
                                        let _ = moveX = proxy.frame(in: .named("d")).minX
                                    }.frame(width: 150, height:1)
                                    
                                                      
                                    ForEach(1..<24, id:\.hashValue) { _ in
                                        Rectangle()
                                            .frame(width: 3, height: 20)
                                            .cornerRadius(24)
                                        Rectangle()
                                            .frame(width: 3, height: 8)
                                            .cornerRadius(24)
                                    }
                                    
                                   
                                    Color.clear.frame(width: 150, height:1)
                                }
                                
                            }
                            .coordinateSpace(name: "d")
                            .foregroundColor(.gray)
                            .cornerRadius(0)
                            
                            
                            HStack {
                                ForEach(1..<32, id:\.hashValue) { _ in
                                    Rectangle()
                                        .frame(width: 5, height: 25)
                                        .cornerRadius(24)
                                        .offset(x: moveX)
                                    
                                    Rectangle()
                                        .frame(width: 5, height: 12)
                                        .cornerRadius(24)
                                        .offset(x: moveX)
                                }
                            }
                            .frame(width: 140, height: 60)
                            .foregroundColor(.gray)
                            .background(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray, lineWidth: 8)

                            }
                            .cornerRadius(12)
                        }
                        
                        Color.clear.frame(height: 60)
                    }
                        
                   
                }
                
                
            }
            .opacity(showMusic ? 1 : 0)
            .animation(.easeInOut(duration: 0.2), value: showMusic)
      
            
            
        }
        .onTapGesture {
            showAddText = true
        }
        .sheet(isPresented: $showPreMusic, content: {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search Music")
                        Spacer()
                    }
                    .padding(.leading, 8)
                    .foregroundColor(.gray)
                    .padding(.vertical, 8)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                    .padding(.horizontal, 8)
                    
                    Text("Cancel")
                }
                .padding(.horizontal, 12)
                
                HStack {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                    Text("Saved")
                        .fontWeight(.medium)
                }
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(.gray)
                .cornerRadius(.infinity)
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    VStack {
                        Text("For You")
                        Rectangle()
                            .frame(height: 1)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical)
                    
                    VStack {
                        Text("Browse")
                            .foregroundColor(.gray)
                        Rectangle()
                            .frame(height: 1)
                            .frame(maxWidth: .infinity)
                            .hidden()
                    }
                }
                .fontWeight(.medium)
                
                
                ScrollView(.vertical) {
                    VStack(spacing: 12) {
                        ForEach(1..<12, id:\.hashValue) { _ in
                            HStack {
                                Image("posts1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height:60)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading) {
                                    Text("I have no enemies")
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                    
                                    Text("Music Trending · 4:33")
                                        .font(.system(size: 14))
                                        .fontWeight(.light)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .fontWeight(.light)
                            }
                            .padding(.horizontal)
                            .onTapGesture {
                                showPreMusic = false
                                showMusic = true
                            }
                        }
                    }
                }
            }
            .padding(.top, 24)
            .searchable(text: .constant(""))
            .frame(maxWidth: .infinity)
            .preferredColorScheme(.dark)
        })
        .preferredColorScheme(.dark)
    }
}

struct CreateStoryPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateStoryPage()
    }
}
