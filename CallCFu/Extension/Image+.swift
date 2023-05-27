//
//  Image+.swift
//  CallCFu
//
//  Created by Ryu on 26/5/2023.
//

import Foundation
import SwiftUI

extension Image {
    func fixedSizeImage( w : CGFloat , h : CGFloat ) -> some View {
        resizable()
        .scaledToFit()
        .frame(width: w , height: h )
    }
}
