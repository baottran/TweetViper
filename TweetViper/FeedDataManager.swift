
import PromiseKit

final class FeedDataManager {
    
    let twitterService: TwitterServiceType
    
    init(twitterService: TwitterServiceType){
        self.twitterService = twitterService
    }
}

protocol FeedDataManagerType: class {
    func fetchTweets() -> Promise<[TweetEntity]>
}

// MARK: - FeedDataManagerType
extension FeedDataManager: FeedDataManagerType {
    func fetchTweets() -> Promise<[TweetEntity]>{
        print("hey look i'm here")
        return twitterService.fetchTweets()
    }
   
}
