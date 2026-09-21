//
//  CommonInjector.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 12/09/2026.
//

import Swinject

class CommonInjector: Injector {
    let container: Container
    static var shared: Injector = CommonInjector()
    
    private init() {
        container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        container.register(HassanDatabaseContainer.self) { _ in
            HassanDatabaseContainer()
        }.inObjectScope(.container)
        
        // UseCases
        container.register(GetCurrentLanguageUseCase.self) { _ in
            GetCurrentLanguageUseCase()
        }.inObjectScope(.weak)
    }
}
