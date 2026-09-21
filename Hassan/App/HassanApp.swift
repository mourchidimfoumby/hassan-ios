//
//  HassanApp.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 10/09/2026.
//

import SwiftUI

@main
struct HassanApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            AppNavigation()
        }
    }
}
