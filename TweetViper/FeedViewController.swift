import UIKit

final class FeedViewController: UIViewController {
    
    var presenter: FeedPresenterViewType!
    var styler: FeedStyleType!
    
    var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    fileprivate var tweets = [TweetEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Sports Feed"

        prepareTableView()
        applyStyles()
        
        presenter.requestTweets()
    }
    
    func prepareTableView(){
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        
        tableView.refreshControl?.addTarget(self, action: #selector(FeedViewController.handleRefresh), for: .valueChanged)
        
        self.view.addSubview(tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "tweetCell")
    }
}

protocol FeedViewType: class {
    func displayTweets(_ tweets: [TweetEntity])
    func handleRefresh()
    func displayNewTweets(_ newTweets: [TweetEntity])
}

// MARK: - FeedViewType
extension FeedViewController: FeedViewType {
    
    func displayTweets(_ tweets: [TweetEntity]){
        self.tweets = tweets
        tableView.reloadData()
    }
    
    func handleRefresh() {
        guard let newestTweet = tweets.first else {
            refreshControl.endRefreshing()
            return
        }
        presenter.requestNewTweets(afterTweet: newestTweet)
    }
    
    func displayNewTweets(_ newTweets: [TweetEntity]){
        let tweetCollection = newTweets + self.tweets
        self.tweets = tweetCollection
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

// MARK: - Private
private extension FeedViewController {
    func applyStyles() {
        styler.styleNavigationBar(self.navigationController!.navigationBar)
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
        
        cell.screenNameLabel.text = tweet.screenName
        cell.statusLabel.text = tweet.text
        cell.profileIconView.image = tweet.profileImage
        cell.timeStampLabel.text = tweet.dateString
        
        styler.styleFeedCell(cell)
    
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.requestDetailsForTweet(self.tweets[indexPath.row])
    }
}
