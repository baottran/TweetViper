import UIKit


final class TweetDetailFeature {
    
    static let featureIdentifier = "TweetDetail"
    
    fileprivate let storyboard: UIStoryboard
    
    init(storyboard: UIStoryboard) {
        self.storyboard = storyboard
    }
}

protocol TweetDetailFeatureType: class {
    func show(fromViewController viewController: UIViewController, tweet: TweetEntity)
}

// MARK: - TweetDetailFeatureType
extension TweetDetailFeature: TweetDetailFeatureType {
    func show(fromViewController viewController: UIViewController, tweet: TweetEntity){
        
        let controller = storyboard.instantiateViewController(withIdentifier: TweetDetailFeature.featureIdentifier) as! TweetDetailViewController
        
        controller.tweet = tweet
        
        if let nav = viewController.navigationController {
            nav.pushViewController(controller, animated: true)
        } else {
            viewController.present(controller, animated: true, completion: nil)
        }
    }

    
    func show(fromViewController viewController: UIViewController) {
        let vc = storyboard.instantiateViewController(withIdentifier: TweetDetailFeature.featureIdentifier) as! TweetDetailViewController
        viewController.show(vc, sender: nil)
    }
}
