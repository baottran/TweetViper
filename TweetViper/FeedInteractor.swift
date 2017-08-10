
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
}

// MARK: - FeedInteractorType
extension FeedInteractor: FeedInteractorType {
    func fetchTweets() {
        dataManager.fetchTweets().then(on: .global(), execute: { tweets -> Void in
            print("tweets are \(tweets)")
            self.presenter.successfullyFetchedTweets(tweets)
        })
        
    }
}
