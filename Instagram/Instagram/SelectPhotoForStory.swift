//
//  SelectPhotoForStory.swift
//  Instagram
//
//  Created by Ryu on 29/1/2024.
//

import SwiftUI
import PhotosUI


struct SelectPhotoForStory: View {
    
    
    @State var images = [UIImage]()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "xmark")
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
                    
                    if images.count == 0 {
                        ProgressView()
                        
                    } else {
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
    }
    
    
    func fetchPhotos() {
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let fetchResult: PHFetchResult<PHAsset> = PHAsset.fetchAssets(with: .image, options: options)
        
        DispatchQueue.global(qos: .background).async {
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
        SelectPhotoForStory()
    }
}
