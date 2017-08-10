import UIKit


final class FeedFeature {
    
    static let featureIdentifier = "Feed"
    
    fileprivate let storyboard: UIStoryboard
    
    init(storyboard: UIStoryboard) {
        self.storyboard = storyboard
    }
}

protocol FeedFeatureType: class {
    func show(fromViewController viewController: UIViewController)
    func showInWindow(_ window: UIWindow)
}

// MARK: - FeedFeatureType
extension FeedFeature: FeedFeatureType {
    
    func show(fromViewController viewController: UIViewController) {
        let vc = storyboard.instantiateViewController(withIdentifier: FeedFeature.featureIdentifier) as! FeedViewController
        viewController.show(vc, sender: nil)
    }
    
    func showInWindow(_ window: UIWindow) {
        let controller = storyboard.instantiateViewController(withIdentifier: FeedFeature.featureIdentifier) as! FeedViewController
        window.rootViewController = UINavigationController(rootViewController: controller)
        window.makeKeyAndVisible()
    }
}
