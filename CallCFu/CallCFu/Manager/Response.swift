//
//  Response.swift
//  CallCFu
//
//  Created by Ryu on 27/5/2023.
//


import Foundation

protocol APIResponse : Identifiable {
    var id: UUID { get set } ;
}
