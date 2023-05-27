//
//  ServiceAPIManager.swift
//  CallCFu
//
//  Created by Ryu on 27/5/2023.
//

import Foundation
import SwiftUI

class ServiceAPIManager {
    struct Response : Decodable, Identifiable {
        var icon : String
        var name : String
        
        var id = UUID()
        
    }
}

class MainServiceAPIManager : ServiceAPIManager {
    
    static let stub : [ServiceAPIManager.Response] = [
        .init(icon: "1", name: "維修安裝"),
        .init(icon: "2", name: "裝修工程"),
        .init(icon: "3", name: "特選服務"),
        .init(icon: "4", name: "電器維修"),
        .init(icon: "5", name: "清潔服務"),
        .init(icon: "6", name: "全屋裝修"),
    ]
 
}

class SubServiceAPIManager : ServiceAPIManager {
    
    static let stub : [ServiceAPIManager.Response] = [
        .init(icon: "7", name: "電力電燈"),
        .init(icon: "8", name: "水喉水務"),
        .init(icon: "9", name: "冷氣空調"),
        .init(icon: "10", name: "清洗冷氣"),
        .init(icon: "11", name: "油漆工程"),
        .init(icon: "12", name: "開鎻換鎖"),
        .init(icon: "13", name: "安裝拆除"),
        .init(icon: "14", name: "鋁窗維修"),
        .init(icon: "15", name: "防水防漏"),
        .init(icon: "16", name: "殺菌消毒"),
        .init(icon: "17", name: "滅蟲滅鼠"),
        .init(icon: "18", name: "除甲醛服務"),
        
    ]
 
}
