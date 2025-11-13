//
//  BabylonApp.swift
//  Babylon
//
//  Created by user278698 on 11/6/25.
//

import SwiftUI

@main
struct BabylonApp: App {
    @StateObject private var cartManager = CartManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
        }
    }
}
