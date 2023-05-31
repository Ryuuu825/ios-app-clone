//
//  String+View.swift
//  CallCFu
//
//  Created by Ryu on 30/5/2023.
//

import Foundation
import SwiftUI

extension StaticString :  View {
    public var body: some View {
        Text(self.description)
    }
}

extension String : View {
    public var body : some View {
        Text(self)
    }
}
