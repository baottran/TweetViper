import Swinject
import SwinjectStoryboard
import Cobra


final class FeedAssembly: Constructible {
    required init() {}
}

// MARK: - AssemblyType
extension FeedAssembly: Assembly {

    func assemble(container: Container) {
        
        // feature
        container.register(FeedFeatureType.self) { resolver in
            return FeedFeature(storyboard: resolver.resolve(SwinjectStoryboard.self, name: FeedFeature.featureIdentifier)!)
        }

        // styles
        container.register(FeedStyleType.self) { resolver in
//            return FeedStyle(colorStyle: resolver.resolve(ColorStyle.self)!, fontStyle:
//                resolver.resolve(FontStyle.self)!, viewStyle: resolver.resolve(ViewStyle.self)!)
            return FeedStyle()
        }
        
        // router
        container.register(FeedRouterType.self) { _, controller in
            return FeedRouter(controller: controller)
        }

        // storyboard
        container.register(SwinjectStoryboard.self, name: FeedFeature.featureIdentifier) { _ in
            return SwinjectStoryboard.create(name: FeedFeature.featureIdentifier, bundle: Bundle(for: FeedAssembly.self), container: container)
        }
        
        // view controller
        container.storyboardInitCompleted(FeedViewController.self, name: FeedFeature.featureIdentifier) { resolver, controller in
            controller.presenter = resolver.resolve(FeedPresenter.self, argument: controller as FeedViewType)!
            controller.styler = resolver.resolve(FeedStyleType.self)!
        }
        
        // presenter
        container.register(FeedPresenter.self) { resolver, view in
            return FeedPresenter(router: resolver.resolve(FeedRouterType.self, argument: view as! UIViewController)!, view: view)
        }.initCompleted { resolver, presenter in
            presenter.interactor = resolver.resolve(FeedInteractorType.self, argument: presenter as FeedPresenterInteractorType)!
        }
        
        // interactor
        container.register(FeedInteractorType.self) { resolver, presenter in
            return FeedInteractor(presenter: presenter, dataManager: resolver.resolve(FeedDataManagerType.self)!)
        }
        
        // data manager
        container.register(FeedDataManagerType.self) { resolver in
            return FeedDataManager(twitterService: resolver.resolve(TwitterServiceType.self)!)
        }
    }

    func loaded(resolver: Resolver) {

    }
}
