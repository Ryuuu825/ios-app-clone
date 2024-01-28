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

struct ContentView: View {
    
    @StateObject var setting = Setting()
    
    var body: some View {
        MainPage()
            .preferredColorScheme(.dark)
            .onAppear {
                let url = URL(string: "http://localhost:5022/api/me")!
                URLSession.shared.dataTask(with: URLRequest(url: url)) { d, r, _ in
                    
                    guard let d = d else {return}
                    setting.me = try! JSONDecoder().decode([UserModel].self, from:d)
                    
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
