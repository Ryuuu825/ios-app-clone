//
//  ContentView.swift
//  Instagram
//
//  Created by Ryu on 20/1/2024.
//

import SwiftUI

class Setting: ObservableObject {
    @Published var me : [UserModel] = []
}

enum PageState  {
    case Home
    case Explore
    case Reels
    case Profile
}

struct ContentView: View {
    
    @StateObject var setting = Setting()
    @State var pageState : PageState = .Home
    
    var body: some View {
        
        NavigationStack {
  
            VStack {
                HStack {
                    switch pageState {
                    case .Home:
                        MainPage()
                    case .Explore:
                        ExplorePage()
                    case .Reels:
                        ReelsPage()
                    case .Profile:
                        ProfilePage()
                    }
                }
                .frame(height: 750)
                .cornerRadius(0)
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
                    Image(systemName: "house")
                        .symbolVariant(pageState == .Home ? .fill : .none)
                        .onTapGesture {
                            pageState = .Home
                        }
                    Image(systemName: "magnifyingglass")
                        .symbolVariant(pageState == .Explore ? .fill : .none)
                        .onTapGesture {
                            pageState = .Explore
                        }
                    Image(systemName: "video")
                        .symbolVariant(pageState == .Reels ? .fill : .none)
                        .onTapGesture {
                            pageState = .Reels
                        }
                    Image(systemName: "person.circle")
                        .symbolVariant(pageState == .Profile ? .fill : .none)
                        .onTapGesture {
                            pageState = .Profile
                        }
                }
                .font(.system(size: 22))
            }
                    }
        .preferredColorScheme(.dark)
        .onAppear {
            let url = URL(string: "http://localhost:5022/api/me")!
            URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r, _ in
                
                guard let d = d else {return}
                DispatchQueue.main.async {
                    setting.me = try! JSONDecoder().decode([UserModel].self, from:d)
                }
                
            }.resume()
        }
        .environmentObject(setting)
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
