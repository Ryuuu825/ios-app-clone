//
//  StorePageView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 15/6/2023.
//

import SwiftUI

struct StorePageView: View {
    
    @State var showSheet : Bool = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Text("Store")
                    .bold()
                    .font(.title3)
                
                GeometryReader { proxy in
                    HStack(spacing: 24) {
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "map")
                    }
                    .fontWeight(.semibold)
                    .font(.body)
                    .padding(.leading , proxy.size.width - 85)
                    .padding(.top , 15)
                        
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background {
                RoundedCorner(radius: 24, corners: [.bottomLeft]).ignoresSafeArea().foregroundColor(.mainColor)
            }
            
            
            HStack {
                Image(systemName: "line.horizontal.3.decrease")
                    .padding(4)
                    .padding(.vertical , 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(Color(UIColor.secondaryLabel), lineWidth: 1)
                    )
                
                HStack {
                    ForEach( ["Nearest" , "All" , "Service"] , id:\.hashValue ) { w in
                        Button { showSheet = true } label: {
                            HStack(alignment: .center, spacing: 4) {
                                Text(w)
                                Image(systemName: "chevron.down")
                                    .offset(y: 1)
                                    .fontWeight(.light)
                            }
                            .padding(.leading, 12)
                            .padding(.trailing, 8)
                            .padding(.vertical , 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: .infinity)
                                    .stroke(Color(UIColor.secondaryLabel), lineWidth: 1)
                            )
                        }
                        .foregroundColor(Color.black)
                    }
                }
                .frame(maxWidth: .infinity , alignment: .leading )
                
                    
            }
            .padding(.horizontal)
            .font(.footnote)
            .padding(.vertical , 24)
            
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    ForEach(1..<12) { _ in
                        HStack(alignment: .top) {
                            Image("ayanami")
                                .resizable()
                                .frame(width: 50 , height: 50)
                                .cornerRadius(12)
                            
                            VStack(alignment:.leading , spacing: 8) {
                                HStack {
                                    Text("Gradeur Garden, Tai Wai")
                                        .bold()
                                        .font(.subheadline)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                        .frame(width: 14, height: 16)
                                        .fontWeight(.regular)
                                }
                                
                                HStack {
                                    Image(systemName: "bag.fill")
                                    Image(systemName: "bag.fill")
                                    Image(systemName: "bag.fill")
                                    
                                }
                                
                                .font(.footnote)
                                .foregroundColor(.mainColor)
                                .frame(maxWidth: .infinity , alignment: .leading)
                                
                                Text("1.0 KM")
                                    .foregroundColor(Color(UIColor.secondaryLabel))
                                    .font(.caption)
                                
                                Text("Shop Nos. 101-102 on the First Floor of Grandeur Garden, Nos. 2-12. Chil Fai Street, Shatin, NT")
                                    .lineLimit(2)
                                    .font(.system(size: 15))
                                    .fontWeight(.regular)
                            }
                            .padding(.horizontal , 12)
                            .frame(maxWidth: .infinity , alignment: .leading)
                        }
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.horizontal)
                        
                        Divider()
                    }
                }
            }
            
            Spacer()
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                HStack {
                    Text("Reset")
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    
                    Spacer()
                    
                    Text("Region")
                    
                    Spacer()
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.mainColor)
                }
                .padding()
                
                VStack {
                    ForEach(["All" , "Hong Kong Island" , "Kowloon" , "New Territories" , "Other"] , id:\.hashValue) { w in
                        if w == "All" {
                            HStack {
                                Text(w)
                                    
                                Spacer()
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(.mainColor)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        } else {
                            Text(w)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                        }
                        
                        Divider()
                    }
                }
                
                Text("Confirm")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background {
                        Color.mainColor
                    }
                    .cornerRadius(.infinity)
                    .padding()
            }
            .presentationDetents([.height(400)])
        }
    }
}

struct StorePageView_Previews: PreviewProvider {
    static var previews: some View {
        StorePageView()
    }
}
