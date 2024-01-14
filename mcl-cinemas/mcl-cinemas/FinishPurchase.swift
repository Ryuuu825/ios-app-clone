//
//  FinishPurchase.swift
//  mcl-cinemas
//
//  Created by Ryu on 14/1/2024.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct FinishPurchase: View {
    let ctx = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @State var img : UIImage? = nil
    
        
    var body: some View {
        NavigationStack {
            VStack {
               
                VStack {
                    VStack {
                        Text("MCL")
                            .font(.title)
                            .fontWeight(.heavy)
                            .italic()
                        
                        Text("CINEMAS")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.secColor)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("The first slam dunk 日語版")
                            .foregroundColor(Color.secColor)
                            .fontWeight(.black)
                            .textCase(.uppercase)
                            .padding(.top)
                        
                        Text("MCL德福戲院")
                            .foregroundColor(SwiftUI.Color(red: 0.4198863506, green: 0.4198863506, blue: 0.4198863506))// #colorLiteral(red: 0.4198863506, green: 0.4198863506, blue: 0.4198863506, alpha: 1)
                     
                       
                        
                        VStack {
                            Text("影院")
                                .foregroundColor(SwiftUI.Color(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            // #colorLiteral(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052, alpha: 1)
                            Text("4院")
                                .foregroundColor(.black)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        VStack {
                            Text("語言/字幕")
                                .foregroundColor(SwiftUI.Color(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            // #colorLiteral(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052, alpha: 1)
                            Text("日語（字幕:中文，英文）")
                                .foregroundColor(.black)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        VStack {
                            Text("日期")
                                .foregroundColor(SwiftUI.Color(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            // #colorLiteral(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052, alpha: 1)
                            Text("2024年01月12日（週五）")
                                .foregroundColor(.black)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        HStack {
                            VStack {
                                Text("場次")
                                    .foregroundColor(SwiftUI.Color(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                // #colorLiteral(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052, alpha: 1)
                                Text("下午 09:35")
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            VStack {
                                Text("座位")
                                    .foregroundColor(SwiftUI.Color(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                // #colorLiteral(red: 0.5648300052, green: 0.5648300052, blue: 0.5648300052, alpha: 1)
                                Text("E10, E11, E12")
                                    .foregroundColor(.black)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        HStack(spacing:0) {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(Color.bgColor)
                                .offset(x: -57)
                                
                            
                            HStack(spacing: 8) {
                                ForEach(1..<18, id:\.hashValue) { _ in
                                    Rectangle()
                                        .frame(width: 8, height: 2)
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(width: 200)
                            
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(Color.bgColor)
                                .offset(x: 57)
                                
                        }
                        .padding(.top , 20)
                        .frame(maxWidth: .infinity)
                        

                        HStack {
                            Spacer()
                            
                            if img != nil {
                                Image(uiImage: img!)
                                    .resizable()
                                    .interpolation(.none)
                                    .frame(width: 130, height: 130)
                            }
                            
                            if img == nil {
                                ProgressView()
                                    .frame(width: 130, height: 130)
                                    .background {
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundColor(Color.secColor)
                                    }
                            }
                            
                            Spacer()
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal , 24)
                    .font(.system(size: 18))
                    .onAppear {
                        filter.message = Data("Hello World".utf8)
                        
                        if let outImage = filter.outputImage {
                            if let cgimg = ctx.createCGImage(outImage, from: outImage.extent) {
                                img = UIImage(cgImage: cgimg)
                            }
                        }
                    }
                    
                    HStack {
                        Image(systemName:"questionmark.circle")
                            .font(.system(size: 18))
                            .italic()
                        
                        Text("條款及細則")
                            .font(.system(size: 18))
                    }
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing , 12)
                    .foregroundColor(.white)
                    .background(Color.secColor)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(12)
                .padding(.horizontal , 24)
                .padding(.vertical , 12)
                
                Text("加至購票紀錄")
                    .frame(maxWidth: .infinity)
                    .frame(width: 310 , height: 50)
                    .background {
                        LinearGradient(colors:[Color.mainColor , Color.secColor] , startPoint: .leading, endPoint: .trailing)
                    }
                    .cornerRadius(.infinity)
                    .padding()
                
                
            }
            .frame(maxWidth: .infinity)
            .background {
                Color.bgColor
                    .ignoresSafeArea(edges: .bottom)
            }
        }
        
        .preferredColorScheme(.dark)
        .navigationTitle("賺票")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct FinishPurchase_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FinishPurchase()
        }
    }
}
