import UIKit


final class FeedRouter {
    
    unowned let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
}

protocol FeedRouterType: class {

}

// MARK: - FeedRouterType
extension FeedRouter: FeedRouterType {
   
}
