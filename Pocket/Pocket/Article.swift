//
//  Article.swift
//  Pocket
//
//  Created by Ryu on 31/5/2023.
//

import Foundation

struct Article : Codable {
    let title : String
    let banner_image : String
    let author : String
    let time_needed : String?
    
    var id = UUID() 
}


