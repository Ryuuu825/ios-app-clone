//
//  Tags.swift
//  Spotify
//
//  Created by Ryu on 1/6/2023.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func Tags( tags : [String] ) -> some View {
        HStack {
            Group {
                ForEach(tags, id:\.hash) { tag in
                    Text(tag)
                }
            }
            .font(.footnote)
            .padding(.horizontal , 12)
            .padding(.vertical , 6)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(24)
            
            
        }
        .padding(.vertical , 1)
        .frame(maxWidth: .infinity , alignment: .leading)

    }
}
