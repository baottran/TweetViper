
import Foundation

final class FeedPresenter {
    
    let router: FeedRouterType
    var interactor: FeedInteractorType!
    weak var view: FeedViewType?
    
    init(router: FeedRouterType, view: FeedViewType) {
        self.router = router
        self.view = view
    }
}

protocol FeedPresenterViewType: class {
    func requestTweets()
    func requestDetailsForTweet(_ tweet: TweetEntity)
    func requestNewTweets(afterTweet tweet: TweetEntity)
}

// MARK: - FeedPresenterViewType
extension FeedPresenter: FeedPresenterViewType {
    func requestTweets() {
        interactor.fetchTweets()
    }
    
    func requestDetailsForTweet(_ tweet: TweetEntity){
        router.showDetailsForTweet(tweet)
    }
    
    func requestNewTweets(afterTweet tweet: TweetEntity) {
        interactor.fetchTweets(afterTweet: tweet)
    }
    
    

}

protocol FeedPresenterInteractorType: class {
    func successfullyFetchedTweets(_ tweets: [TweetEntity])
    func successfullyFetchedNewTweets(_ tweets: [TweetEntity])
    func failedToFetchTweets(_ tweets: [TweetEntity])
}

// MARK: - FeedPresenterInteractorType
extension FeedPresenter: FeedPresenterInteractorType {
    
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
    
    func successfullyFetchedTweets(_ tweets: [TweetEntity]){
        DispatchQueue.main.async {
            self.view?.displayTweets(tweets)
        }
    }
    
    func failedToFetchTweets(_ tweets: [TweetEntity]){
        print("error fetching tweets")
    }
    
    func successfullyFetchedNewTweets(_ tweets: [TweetEntity]){
        DispatchQueue.main.async {
            self.view?.displayNewTweets(tweets)
        }
    }
}

