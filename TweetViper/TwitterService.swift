import PromiseKit
import TwitterKit

final class TwitterService {
    
}

protocol TwitterServiceType: class {
    func fetchTweets() -> Promise<[TweetEntity]>
    func fetchTweets(afterTweet tweet: TweetEntity) -> Promise<[TweetEntity]>
}

// MARK: - CityServiceType
extension TwitterService: TwitterServiceType {
    func fetchTweets() -> Promise<[TweetEntity]> {
        return Promise<[TweetEntity]> { resolve, reject in
        
            let parameters = ["slug": "nba", "owner_screen_name": "baottran"]
            let url = "https://api.twitter.com/1.1/lists/statuses.json"
            var error : NSError?
            
            let req = TWTRAPIClient().urlRequest(withMethod: "GET", url: url, parameters: parameters, error: &error)
            
            TWTRAPIClient().sendTwitterRequest(req, completion: { (response, data, error) in
                
                do {
                    guard let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String : Any]] else {
                        return
                    }
                    
                    var tweets = [TweetEntity]()
                    
                    for obj in response {
                        if let tweet = TweetEntity(json: obj) {
                            tweets.append(tweet)
                        }
                    }
                    
                    resolve(tweets)
                }
                catch {
                    reject(error)
                }
            })
        }
    }
    
    func fetchTweets(afterTweet tweet: TweetEntity) -> Promise<[TweetEntity]> {
        return Promise<[TweetEntity]> { resolve, reject in
            
            let parameters = ["slug": "nba",
                              "owner_screen_name": "baottran",
                              "since_id": tweet.id]
            
            let url = "https://api.twitter.com/1.1/lists/statuses.json"
            var error : NSError?
            
            let req = TWTRAPIClient().urlRequest(withMethod: "GET", url: url, parameters: parameters, error: &error)
            
            TWTRAPIClient().sendTwitterRequest(req, completion: { (response, data, error) in
                
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String : Any]] else {
                        return
                    }
                    
                    var tweets = [TweetEntity]()
                    print("came back with new tweets \(json)")
                    for obj in json {
                        
                        if let tweet = TweetEntity(json: obj) {
                            tweets.append(tweet)
                        }
                    }
                    
                    resolve(tweets)
                }
                catch {
                    reject(error)
                }
            })
        }
    }
}
