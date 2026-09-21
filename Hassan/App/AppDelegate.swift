import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
    ) -> Bool {
        FirebaseApp.configure()
        configureFirestoreDb()
        runStartupTasks()
        return true
    }
    
    private func configureFirestoreDb() {
        let db = Firestore.firestore()
        let settings = FirestoreSettings()
        settings.cacheSettings = MemoryCacheSettings()
        db.settings = settings
    }
    
    private func runStartupTasks() {
        let startupQuranTask = QuranInjector.shared.resolve(StartupQuranTask.self)
        startupQuranTask.run()
    }
}
