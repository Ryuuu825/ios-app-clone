//
//  SelectPhotoForStory.swift
//  Instagram
//
//  Created by Ryu on 29/1/2024.
//

import SwiftUI
import PhotosUI

enum StoryPageState {
    case CreateStory
    case Nth
}

struct SelectPhotoForStory: View {
    
    
    @State var images = [UIImage]()
    @State var loadingEffect : CGFloat = 0.5
    
    @State var pageState : StoryPageState = .Nth
    
    let dismiss : () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "xmark")
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                    Text("Add to story")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "gearshape")
                }
                .font(.system(size: 22))
                .padding(.horizontal, 12)
                
                HStack {
                    HStack(spacing: 4) {
                        Text("Recents")
                        
                        Image(systemName: "chevron.down")
                    }
                    .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack {
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.white , lineWidth: 1.5)
                                .frame(width: 12 , height: 12)
                            
                            Rectangle()
                                .foregroundColor(Color(uiColor: .secondarySystemBackground))
                                .frame(width: 12 , height: 12)
                                .cornerRadius(4)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(.white , lineWidth: 1.5)
                                        .frame(width: 12 , height: 12)
                                }
                                .offset(x: -3 , y: -3)
                            
                        }
                        
                        Text("Select")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(.infinity)
                }
                .padding(.horizontal)
                
               
                
                
                GeometryReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: Array(repeating: GridItem(spacing: 2), count: 3), spacing: 2) {
                            
                            ZStack {
                                Image(systemName: "camera")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 22))
                                
                                Text("Camera")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .offset(x: -25 , y: 100)
                            }
                            .frame(width: proxy.size.width/3, height: 230)
                            .background(Color(uiColor: .secondarySystemBackground))
                            .cornerRadius(0)
                            
                            ZStack {
                                Image("story")
                                    .resizable()
                                    .frame(width: proxy.size.width/3, height: 230)
                                    .scaledToFill()
                                    .cornerRadius(0)
                                
                                Image(systemName: "infinity")
                                    .fontWeight(.semibold)
                                    .offset(x: -45 , y: -95)
                            }
                            .frame(width: proxy.size.width/3, height: 230)
                            .cornerRadius(0)
                            .background(Color(uiColor: .systemBackground))
                            .onTapGesture {
                                pageState = .CreateStory
                            }
                            
                            
                            if images.count == 0 {
                                
                                ZStack {
                                    ProgressView()
                                }
                                .frame(width: proxy.size.width/3, height: 230)
                                .cornerRadius(0)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .opacity(loadingEffect)
                                .onAppear {
                                    DispatchQueue.main.async {
                                        withAnimation(.spring(response: 1).repeatForever()) {
                                            loadingEffect = loadingEffect == 1 ? 0.5 : 1
                                        }
                                    }
                                }
                               
                                
                            } else {
                                
                                    ForEach(images, id:\.hashValue) { image in
                                        ZStack {
                                            Image(uiImage: image)
                                                .resizable()
                                                .frame(width: proxy.size.width/3, height: 230)
                                                .scaledToFill()
                                                .cornerRadius(0)
                                            
                                            Image(systemName: "infinity")
                                                .fontWeight(.semibold)
                                                .offset(x: -45 , y: -95)
                                        }
                                        .frame(width: proxy.size.width/3, height: 230)
                                        .cornerRadius(0)
                                        .background(Color(uiColor: .systemBackground))
                                    }
                                }
                            }
                    }
                    .onAppear {
                        fetchPhotos()
                    }
                }
            }
            .preferredColorScheme(.dark)
            
            ZStack {
                Color.black
                CreateStoryPage {
                    dismiss()
                }
            }
            .animation(.easeInOut, value: pageState)
            .opacity(pageState == .CreateStory ? 1 : 0)
            
        }
        .ignoresSafeArea(edges: .bottom)
        .background(.black)
    }
    
    
    func fetchPhotos() {
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: .image, options: options)
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
            fetchResult.enumerateObjects { (asset, _, _) in
                let imageManager = PHImageManager.default()
                let requestOptions = PHImageRequestOptions()
                requestOptions.isSynchronous = true
                
                imageManager.requestImage(for: asset, targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: requestOptions) { (image, _) in
                    if let image = image {
                        
                        DispatchQueue.main.async {
                            images.append(image)
                            
                        }
                    }
                }
            }
        }
    }
}

struct SelectPhotoForStory_Previews: PreviewProvider {
    static var previews: some View {
        SelectPhotoForStory {
            
        }
    }
}
