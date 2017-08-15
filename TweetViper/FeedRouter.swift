import UIKit
import Cobra

final class FeedRouter {
    
    unowned let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}

protocol FeedRouterType: class {
    func showDetailsForTweet(_ tweet: TweetEntity)
}

// MARK: - FeedRouterType
extension FeedRouter: FeedRouterType {
    func showDetailsForTweet(_ tweet: TweetEntity) {
        try! App.sharedInstance.feature(TweetDetailFeatureType.self).show(fromViewController: controller, tweet: tweet)
    }
}
