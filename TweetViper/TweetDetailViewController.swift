import UIKit


final class TweetDetailViewController: UIViewController {
    
    var presenter: TweetDetailPresenterViewType!
    var styler: TweetDetailStyleType!
    
    var tweet: TweetEntity!
    
    var statusLabel = UILabel()
    var screenNameLabel = UILabel()
    var profileIconView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenNameLabel.text = tweet.screenName
        statusLabel.text = tweet.text
        profileIconView.image = tweet.profileImage
    
        
        self.view.addSubview(statusLabel)
        self.view.addSubview(screenNameLabel)
        self.view.addSubview(profileIconView)
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        profileIconView.translatesAutoresizingMaskIntoConstraints = false
        screenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // status label
        
        self.statusLabel.numberOfLines = 0
        
        statusLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        statusLabel.topAnchor.constraint(equalTo: screenNameLabel.bottomAnchor, constant: 10).isActive = true
        
        
        // screen name label
        
        screenNameLabel.leftAnchor.constraint(equalTo: statusLabel.leftAnchor).isActive = true
        screenNameLabel.rightAnchor.constraint(equalTo: statusLabel.rightAnchor).isActive = true
        screenNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        
        // profile icon
        
        profileIconView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                              constant: 20).isActive = true
        profileIconView.topAnchor.constraint(equalTo: view.topAnchor,
                                             constant: 10).isActive = true
        profileIconView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileIconView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        applyStyles()
    }
}

protocol TweetDetailViewType: class {
    
}

// MARK: - TweetDetailViewType
extension TweetDetailViewController: TweetDetailViewType {
   
}

// MARK: - Private
private extension TweetDetailViewController {
    func applyStyles() {
        
    }
}
