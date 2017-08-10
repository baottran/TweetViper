import PromiseKit
import TwitterKit

final class TwitterService {
    
}

protocol TwitterServiceType: class {
    func fetchTweets() -> Promise<[TweetEntity]>
}

// MARK: - CityServiceType
extension TwitterService: TwitterServiceType {
    func fetchTweets() -> Promise<[TweetEntity]> {
        
        return Promise<[TweetEntity]> { resolve, reject in
        
            let parameters = ["screen_name": "locationlabs", "count": "15"]
            var error : NSError?
            let req = TWTRAPIClient().urlRequest(withMethod: "GET", url: "https://api.twitter.com/1.1/statuses/user_timeline.json", parameters: parameters, error: &error)
            TWTRAPIClient().sendTwitterRequest(req, completion: { (response, data, error) in
                do {
                    guard let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String : Any]] else {
                        return
                    }
                    
                    var tweets = [TweetEntity]()
                    
                    for obj in response {
                        if let text = obj["text"] as? String {
                            let tweet = TweetEntity(text: text)
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
