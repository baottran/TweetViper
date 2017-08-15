import UIKit


final class FeedFeature {
    
    static let featureIdentifier = "Feed"
    
    fileprivate let controller: FeedViewType
    
    
    init(controller: FeedViewType) {
        self.controller = controller
    }
}

protocol FeedFeatureType: class {
    func show(fromViewController viewController: UIViewController)
    func showInWindow(_ window: UIWindow)
}

// MARK: - FeedFeatureType
extension FeedFeature: FeedFeatureType {
    
    func show(fromViewController viewController: UIViewController) {
//        let vc = storyboard.instantiateViewController(withIdentifier: FeedFeature.featureIdentifier) as! FeedViewController
//        viewController.show(vc, sender: nil)
    }

    func showInWindow(_ window: UIWindow) {
        
//        let controller = storyboard.instantiateViewController(withIdentifier: FeedFeature.featureIdentifier) as! FeedViewController
//        let controller = FeedViewContro
        window.rootViewController = UINavigationController(rootViewController: controller as! UIViewController)
        window.makeKeyAndVisible()
    }
}
