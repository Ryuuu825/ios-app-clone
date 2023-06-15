//
//  ContentView.swift
//  TamJaiSamGor
//
//  Created by Ryu on 11/6/2023.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension Color {
    static let mainColor : Color = Color(red: 0.5490637422, green: 0.09403692931, blue: 0.08240876347)
    static let secondaryColor : Color = Color(red: 0.964710772, green: 0.9411751628, blue: 0.9215704799)
    static let gold : Color = Color(red: 0.7058998227, green: 0.6274454474, blue: 0.4941292882)
}

enum Tab : View , CaseIterable, Identifiable {
    case Home, Indox, Gift, Loc, Setting
    
    @ViewBuilder var body : some View {
        switch self {
        case .Home: HomePageView()
        case .Indox: InboxPageView()
        case .Gift: RewardRedmptionPageView()
        case .Loc: StorePageView()
        case .Setting: SettingPageView()
        }
    }
    
    @ViewBuilder var tabItem : some View {
        switch self {
            case .Home: Image(systemName: "house")
            case .Indox: Image(systemName: "mail")
            case .Gift: Image(systemName: "gift")
            case .Loc: Image(systemName: "mappin")
            case .Setting: Image(systemName: "ellipsis")
        }
    }
    
    var id : Self { self }
}
struct ContentView: View {
    
    @State var tab : Tab = .Home
    
    var body: some View {
        ZStack {
            VStack {
                tab
                
                Color.clear.frame(height: 50)
            }
            
            GeometryReader { proxy in
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()) , count: Tab.allCases.count))  {
                    ForEach(Tab.allCases) { t in
                        Button { tab = t } label: {
                            t.tabItem
                                .foregroundColor(t == tab ? .mainColor : .black)
                        }
                    }
                }
                .fontWeight(.regular)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background { Color.white.ignoresSafeArea() }
                .padding(.top , proxy.size.height - 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
