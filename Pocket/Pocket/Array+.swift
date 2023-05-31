//
//  Array+.swift
//  Pocket
//
//  Created by Ryu on 31/5/2023.
//

import Foundation


extension Array: RawRepresentable where Element : Codable {
    
    
    public init?(rawValue: String ) {
        guard let data = rawValue.data(using: .utf8),
              let array = try? JSONDecoder().decode(Self.self , from: data) else { return nil }
        
        self = array ;
        
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let str = String(data: data , encoding: .utf8) else { return "" }
        return str
    }
    
    
}
