//
//  View+.swift
//  CallCFu
//
//  Created by Ryu on 26/5/2023.
//

import Foundation
import SwiftUI

extension View {
    func marginY(_ x : CGFloat) -> some View {
        padding(.top , x )
        .padding(.bottom, x )
    }
}
