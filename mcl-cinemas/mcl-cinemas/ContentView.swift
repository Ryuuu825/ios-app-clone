//
//  ContentView.swift
//  mcl-cinemas
//
//  Created by Ryu on 22/12/2023.
//

import SwiftUI


enum PageIdx {
    case Main, PurchaseRecord, Gift, Wallet
}

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func popToRoot() {
        print(path)
    }
}

struct ContentView: View {
    
    @State var cpage : PageIdx = .Main
    @StateObject var navigationCoordinator = NavigationCoordinator()
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            VStack(spacing: 0){
                
                
                if cpage == .Main {
                    MainPage()
                } else if cpage == .PurchaseRecord {
                    PurchaseRecord()
                }
                
                GeometryReader { proxy in
                    HStack {
                        VStack(spacing: 6) {
                            Image(systemName: "house")
                                .font(.system(size: 18))
                            
                            Text("主頁")
                                .font(.system(size: 12))
                        }
                        .frame(width: proxy.size.width * 0.17)
                        .onTapGesture {
                            cpage = .Main
                        }
                        .foregroundColor(cpage == .Main ? Color.mainColor : .white)
                        
                        VStack(spacing: 6) {
                            Image(systemName: "newspaper")
                                .font(.system(size: 18))
                            
                            Text("主頁")
                                .font(.system(size: 12))
                        }
                        .frame(width: proxy.size.width * 0.17)
                        .onTapGesture {
                            cpage = .PurchaseRecord
                        }
                        .foregroundColor(cpage == .PurchaseRecord ? Color.mainColor : .white)
                        
                        
                        ZStack {
                            
                            LinearGradient(colors: [.mainColor, .secColor], startPoint: .leading, endPoint: .trailing)
                                .padding(.top, 32)
                                .cornerRadius(.infinity)
                                .padding(.top, -32)
                                .frame(height: 50)
                            
                        
                            
                            VStack(spacing: 6) {
                                Image(systemName: "qrcode")
                                    .font(.system(size: 18))
                                
                                Text("會員")
                                    .font(.system(size: 12))
                            }
                            
                        }
                        .frame(width: proxy.size.width * 0.17)
                        
                        
                        VStack(spacing: 6) {
                            Image(systemName: "gift")
                                .font(.system(size: 18))
                            
                            Text("獎賞")
                                .font(.system(size: 12))
                        }
                        .frame(width: proxy.size.width * 0.17)
                        
                        VStack(spacing: 6) {
                            Image(systemName: "menucard")
                                .font(.system(size: 18))
                            
                            Text("錢包")
                                .font(.system(size: 12))
                        }
                        .frame(width: proxy.size.width * 0.17)
                    }
                    .padding(.vertical)
                    .padding(.bottom, 18)
                    .padding(.leading, 12)
                    
                }
                .frame(height: 35)
                .background(Color(red: 0.04416629672, green: 0.0659404695, blue: 0.1134429052))
            }
        }
        .preferredColorScheme(.dark)
        .environmentObject(navigationCoordinator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
