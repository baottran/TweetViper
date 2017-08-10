import Swinject
import Cobra


/**
 The ServiceAssembly assembles the services of the application
 */
final class ServiceAssembly: Constructible {
    required init() {}
}

// MARK: - AssemblyType
extension ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(TwitterServiceType.self) { _ in
            return TwitterService()
        }
    }
    
    func loaded(resolver: Resolver) {
        
    }
}
