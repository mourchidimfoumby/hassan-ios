import Swinject

class AppInjector: Injector {
    static var shared: Injector = AppInjector()
    let container: Container
    
    private init() {
        container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        // Others
        container.register(NetworkMonitor.self) { _ in
            NetworkMonitorImpl()
        }.inObjectScope(.container)
    }
}
