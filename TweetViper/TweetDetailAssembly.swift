import Swinject
import SwinjectStoryboard
import Cobra


final class TweetDetailAssembly: Constructible {
    required init() {}
}

// MARK: - AssemblyType
extension TweetDetailAssembly: Assembly {

    func assemble(container: Container) {
        
        // feature
        container.register(TweetDetailFeatureType.self) { resolver in
            return TweetDetailFeature(storyboard: resolver.resolve(SwinjectStoryboard.self, name: TweetDetailFeature.featureIdentifier)!)
        }

        // styles
        container.register(TweetDetailStyleType.self) { resolver in
//            return TweetDetailStyle(colorStyle: resolver.resolve(ColorStyle.self)!, fontStyle:
//                resolver.resolve(FontStyle.self)!, viewStyle: resolver.resolve(ViewStyle.self)!)
            return TweetDetailStyle()
        }
        
        // router
        container.register(TweetDetailRouterType.self) { _, controller in
            return TweetDetailRouter(controller: controller)
        }

        // storyboard
        container.register(SwinjectStoryboard.self, name: TweetDetailFeature.featureIdentifier) { _ in
            return SwinjectStoryboard.create(name: TweetDetailFeature.featureIdentifier, bundle: Bundle(for: TweetDetailAssembly.self), container: container)
        }
        
        // view controller
        container.storyboardInitCompleted(TweetDetailViewController.self, name: TweetDetailFeature.featureIdentifier) { resolver, controller in
            controller.presenter = resolver.resolve(TweetDetailPresenter.self, argument: controller as TweetDetailViewType)!
            controller.styler = resolver.resolve(TweetDetailStyleType.self)!
        }
        
        // presenter
        container.register(TweetDetailPresenter.self) { resolver, view in
            return TweetDetailPresenter(router: resolver.resolve(TweetDetailRouterType.self, argument: view as! UIViewController)!, view: view)
        }.initCompleted { resolver, presenter in
            presenter.interactor = resolver.resolve(TweetDetailInteractorType.self, argument: presenter as TweetDetailPresenterInteractorType)!
        }
        
        // interactor
        container.register(TweetDetailInteractorType.self) { resolver, presenter in
            return TweetDetailInteractor(presenter: presenter, dataManager: resolver.resolve(TweetDetailDataManagerType.self)!)
        }
        
        // data manager
        container.register(TweetDetailDataManagerType.self) { _ in
            return TweetDetailDataManager()
        }
    }

    func loaded(resolver: Resolver) {

    }
}
