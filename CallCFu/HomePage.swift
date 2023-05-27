//
//  ContentView.swift
//  CallCFu
//
//  Created by Ryu on 26/5/2023.
//

import SwiftUI

extension VStack {
    func coloredBox( _  color : Color ) -> some View {
        fontWeight(.semibold)
        .foregroundColor(.white)
        .padding(.vertical , 6 )
        .padding( .horizontal , 16 )
        .background(color)
        .cornerRadius(10)
        .clipped()
    }
}

extension View {
    func group(_ title : String , @ViewBuilder content : @escaping () -> some View ) -> some View {
        content()
    }
}

struct HomePage: View {
    
    let mainService : [ServiceAPIManager.Response] = MainServiceAPIManager.stub
    
    static let colors : [Color] = [
        Color.orange,
        Color( red: 1, green: 0.3371802568, blue:0.3255383372),
        Color( red: 0.7569037676, green: 0.3176192641, blue: 0.7607760429),
        Color(red: 0.9922018647, green: 0.7568446994, blue: 0.02408674173),
        Color( red: 0.003241513856, green: 0.6000111699, blue: 0.4666650295 ),
        Color( red: 0.01448722556, green: 0.7137425542, blue: 0.8470447659 )
    ]
    
    
    let subService : [ServiceAPIManager.Response] = SubServiceAPIManager.stub
    let userFeedback : [UserFeedBackAPIManager.Response] = UserFeedBackAPIManager.stub
    let news : [NewsAPIManager.Response] = NewsAPIManager.stub
    
   
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in

                VStack {
                    
                    VStack {
                        Text("選擇所需服務")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(10)
                    }
                    .background( Color(red: 1, green: 0.5882030129, blue: 0.0004810865503).ignoresSafeArea(.all) )
                 

                    ScrollView( showsIndicators: false ) {
                        
                        group("Main Service") {
                            LazyVGrid( columns: Array(repeating: GridItem(.flexible()), count: 3 ) , spacing: 5 ) {
                                
                                ForEach(0..<mainService.count) { index in
                                    serviceTypeTab(mainService[index].name , color: Self.colors[index] ) {
                                        Image(mainService[index].icon)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: .infinity , height: 90 )
                                    }
                                }
                                
                            }
                            .padding()
                        }


                        group("recommend service / sub service ") {
                            Text("推介服務")
                                .foregroundColor(.secondaryLabel)
                                
                            
                            LazyVGrid( columns: Array(repeating: GridItem(.flexible()), count: 4 ) , spacing: 15 ) {
                                
                                ForEach(0..<subService.count) { index in
                                    subServiceTypeTab(subService[index].name) {
                                        Image(subService[index].icon)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: .infinity , height: 72 )
                                    }
                                }
                                
                            }
                            .padding()
                        }

                        
                        
                        group("some stat") {
                            HStack {
                                Group {
                                    stat("註冊師傅")
                                    
                                    stat("配對柯圢")
       
                                }
                                .frame(width: proxy.size.width * 0.47 )
                                .background(Color.systemBackground)
                                
                            }
                            .marginY(12)
                            .frame(maxWidth: .infinity)
                            .background(Color.secondarySystemBackground)
                        }
                        
                        
                        
                        group("user feedback") {
                            ScrollView(.horizontal , showsIndicators: false ) {
                                LazyHStack {
                                    ForEach(userFeedback) { feedback in
                                        userFeedbackBox(feedback, w: proxy.size.width * 0.45 )
                                    }
                                }
                            }
                            .padding(.horizontal , 10 )
                        }
                        
                        
                        group("News") {
                            
                               VStack {
                                   ForEach(news) { new in
                                       newsRow(new , imageW: proxy.size.width * 0.33 )
                                   }
                               }
                               .padding(.vertical , 10)
                               .padding(.horizontal , 10)
                               .padding(.bottom , 20)
                               .background(Color.secondarySystemBackground)
                        }
   
                    }
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity)
                }
                
            }
        }
        
    }
    
    @ViewBuilder func stat(_ title : String , range : Range<Int> = 10000..<30000 ) -> some View {
        VStack {
            Text(Int.random(in: range).formatted())
                .foregroundColor(Color.orange)
                .font(.headline)
            
            
            Text(title)
                .font(.body)
                .foregroundColor(Color.secondaryLabel)
            
        }
        .padding(.vertical , 8 )
    }
    
    
    @ViewBuilder func serviceTypeTab(_ title : String , color : Color , @ViewBuilder  content : @escaping () -> some View ) -> some View {
        VStack {
            
            NavigationLink(destination: Text("abc"), label: {
                content()
            })
            
            Text(title)
        }
        .coloredBox(color)
    }
    
    @ViewBuilder func subServiceTypeTab(_ title : String  , @ViewBuilder  content : @escaping () -> some View ) -> some View {
        VStack {
            
            NavigationLink(destination: Text("abc"), label: {
                content()
            })
            
            Text(title)
        }
       
    }
    
    @ViewBuilder func userFeedbackBox(_ feedback : UserFeedBackAPIManager.Response , w : CGFloat) -> some View {
        VStack {
            
            HStack (spacing: 1) {
  
                Image("icon")
                    .fixedSizeImage(w: 30, h: 30)
                
                Text(feedback.user)
                    .padding(.trailing, 12 )
   
            }
            
            Spacer()
            
            Text(feedback.comment)
                .font(.system(size: 14 ))
                .foregroundColor(Color.secondaryLabel)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            
            Spacer()
            
        }
        .padding()
        .frame(width: w , height: 130 )
        .background(Color(red: 1, green: 0.9529371858, blue: 0.8156967163))
        .border(Color.orange , width: 1 )
        .overlay {
            GeometryReader { proxy in
                Text("Feedback")
                    .font(.footnote)
                    .foregroundColor(Color.white)
                    .padding( .horizontal , 4)
                    .background(Color.orange)
                    .offset(x: proxy.size.width - 68 , y : 0)
            }
        }
    }
    
    
    @ViewBuilder func newsRow( _ new : NewsAPIManager.Response, imageW : CGFloat ) -> some View {
        HStack {
            Image(new.image)
                .resizable()
                .frame(width: imageW , height: .infinity )
            
            VStack( alignment: .leading) {
                Text(new.title)
                    .font(.system(size: 16))
                    .bold()
                    .lineLimit(1)
                    .padding(.bottom, 2)
                
                Text(new.body)
                    .font(.footnote)
                    .lineLimit(2)
                    .padding(.trailing , 10)
                    
            }
        }
        .background(Color.systemBackground)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environment(\.colorScheme, .light)
    }
}
