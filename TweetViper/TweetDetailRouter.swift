import UIKit


final class TweetDetailRouter {
    
    unowned let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}

protocol TweetDetailRouterType: class {

}

// MARK: - TweetDetailRouterType
extension TweetDetailRouter: TweetDetailRouterType {
   
}
