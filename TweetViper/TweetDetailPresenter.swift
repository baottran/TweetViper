
final class TweetDetailPresenter {
    
    let router: TweetDetailRouterType
    var interactor: TweetDetailInteractorType!
    weak var view: TweetDetailViewType?
    
    init(router: TweetDetailRouterType, view: TweetDetailViewType) {
        self.router = router
        self.view = view
    }
}

protocol TweetDetailPresenterViewType: class {

}

// MARK: - TweetDetailPresenterViewType
extension TweetDetailPresenter: TweetDetailPresenterViewType {

}

protocol TweetDetailPresenterInteractorType: class {

}

// MARK: - TweetDetailPresenterInteractorType
extension TweetDetailPresenter: TweetDetailPresenterInteractorType {
    
//    /**
//     *
//     * Common way of implementing methods in PresenterInteractorType:
//     *
//     * Whenever a command is received, it is asynchronously forwarded to the view
//     * on the main thread.
//     *
//     * Make sure that the block does not capture a strong reference to the presenter
//     * as it commonly extends the lifetime of the presenter by mistake.
//     *
//     */
//    func tellViewToDoFoo() {
//        asyncMain {
//            [weak self] in
//            self?.view?.doFoo()
//        }
//    }

}
