
import PromiseKit

final class FeedInteractor {
    
    unowned let presenter: FeedPresenterInteractorType
    let dataManager: FeedDataManagerType
    
    init(presenter: FeedPresenterInteractorType, dataManager: FeedDataManagerType) {
        self.presenter = presenter
        self.dataManager = dataManager
    }
}

protocol FeedInteractorType: class {
    func fetchTweets()
    func fetchTweets(afterTweet tweet: TweetEntity)
}

// MARK: - FeedInteractorType
extension FeedInteractor: FeedInteractorType {
    func fetchTweets(afterTweet tweet: TweetEntity) {
        _ = dataManager.fetchTweets(afterTweet: tweet)
            .then(on: .global(), execute: { tweets in
                return when(fulfilled: tweets.map { self.dataManager.fetchProfileImage(forTweet: $0) })
            }).then(on: .global(), execute: { tweets in
                self.presenter.successfullyFetchedNewTweets(tweets)
            }).catch { error in
                print("error \(error)")
        }
    }

    func fetchTweets() {
        _ = dataManager.fetchTweets()
            .then(on: .global(), execute: { tweets in
                return when(fulfilled: tweets.map { self.dataManager.fetchProfileImage(forTweet: $0) })
            }).then(on: .global(), execute: { tweets in
            self.presenter.successfullyFetchedTweets(tweets)
            }).catch { error in
            print("error \(error)")
        }
        
    }
}
