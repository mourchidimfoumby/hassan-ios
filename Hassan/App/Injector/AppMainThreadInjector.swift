//
//  AppMainThreadInjector.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Swinject

class AppMainThreadInjector: MainThreadInjector {
    let container: Container
    static var shared: MainThreadInjector = AppMainThreadInjector()
    
    private init() {
        container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        // View models
        container.register(AppNavigationViewModel.self) { _ in
            AppNavigationViewModel()
        }
    }
}
