//
//  CallCFuApp.swift
//  CallCFu
//
//  Created by Ryu on 26/5/2023.
//

import SwiftUI

@main
struct CallCFuApp: App {
    var body: some Scene {
        WindowGroup {
            AppEntry()
                .environment(\.colorScheme, .light)
        }
    }
}
