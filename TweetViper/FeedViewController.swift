import UIKit


final class FeedViewController: UIViewController {
    
    var presenter: FeedPresenterViewType!
    var styler: FeedStyleType!
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var tweets = [TweetEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyles()
        
        tableView.dataSource = self //
        
        presenter.requestTweets()
    }
}

protocol FeedViewType: class {
    func displayTweets(_ tweets: [TweetEntity])
}

// MARK: - FeedViewType
extension FeedViewController: FeedViewType {
    
    func displayTweets(_ tweets: [TweetEntity]){
        self.tweets = tweets
        tableView.reloadData()
    }
   
}

// MARK: - Private
private extension FeedViewController {
    func applyStyles() {
        
    }
}

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell") as! FeedTableViewCell
        let tweet = tweets[indexPath.row]
        cell.statusLabel.text = tweet.text
        
        return cell
    }
}
