//
//  UserFeedBackAPIManager.swift
//  CallCFu
//
//  Created by Ryu on 27/5/2023.
//

import Foundation

class UserFeedBackAPIManager  {
    
    struct Response : APIResponse {
        let user : String
        let comment : String
        
        var id = UUID()
    }
    
    static let stub : [UserFeedBackAPIManager.Response] = [
        .init(user:"威", comment: "提早到，耐心，檢查細心，禮貌，清晰解決問題"),
        .init(user:"陳生", comment: "細心，準時，有禮貌，解釋詳盡"),
        .init(user:"John", comment: "非常滿意，服務態度好，專業程度高"),
        .init(user:"Doe", comment: "稍有不足，但整體還算滿意"),
        .init(user:"Alice", comment: "服務一般，需要進一步提升"),
        .init(user:"Bob", comment: "極度不滿，建議改進"),
        .init(user:"Charlie", comment: "沒有提供任何幫助，非常失望"),
        .init(user:"水魚", comment: "水咗 me $1000"),
    ]
 
}
