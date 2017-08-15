
import PromiseKit

var imageCache = [String: UIImage]()

final class FeedDataManager {
    
    let twitterService: TwitterServiceType
//    var imageCache: [String: UIImage]!
    
    init(twitterService: TwitterServiceType){
        self.twitterService = twitterService
//        self.imageCache = [String: UIImage]()
    }
}

protocol FeedDataManagerType: class {
    func fetchTweets() -> Promise<[TweetEntity]>
    func fetchProfileImage(forTweet tweet: TweetEntity) -> Promise<TweetEntity>
    func fetchTweets(afterTweet tweet: TweetEntity) -> Promise<[TweetEntity]>
}

// MARK: - FeedDataManagerType
extension FeedDataManager: FeedDataManagerType {
    func fetchTweets() -> Promise<[TweetEntity]>{
        return twitterService.fetchTweets()
    }
    
    func fetchTweets(afterTweet tweet: TweetEntity) -> Promise<[TweetEntity]> {
        return twitterService.fetchTweets(afterTweet: tweet)
    }
    
    func fetchProfileImage(forTweet tweet: TweetEntity) -> Promise<TweetEntity> {
        return Promise<TweetEntity> { resolve, reject in
            
            var updatedTweet = tweet

            
            if let image = imageCache[tweet.profileImageURLString] {
                print("found cached image for \(tweet.profileImageURLString)")
                updatedTweet.profileImage = image
                resolve(updatedTweet)
                return
            }
            
            let url = URL(string: tweet.profileImageURLString)!
            URLSession.shared.dataTask(with: url){ data, response, error in
                if let data = data {
                    let image = UIImage(data: data)!
                    print("saving image for \(tweet.profileImageURLString)")
                    imageCache[tweet.profileImageURLString] = image
                    updatedTweet.profileImage = image
                    resolve(updatedTweet)
                } else {
                    reject(error!)
                }
            }.resume()
        }
    }
   
}
