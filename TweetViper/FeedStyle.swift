import UIKit


class FeedStyle {
    
}

protocol FeedStyleType {
    func styleNavigationBar(_ navigationBar: UINavigationBar)
    func styleFeedCell(_ cell: FeedTableViewCell)
}

// MARK: - FeedStyleType
extension FeedStyle: FeedStyleType {
    func styleNavigationBar(_ navigationBar: UINavigationBar) {
        navigationBar.barTintColor = UIColor(red:0.96, green:0.50, blue:0.15, alpha:1.0)
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.barStyle = .default
        navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 20.0)!
        ]
    }
    
    func styleFeedCell(_ cell: FeedTableViewCell){
        cell.screenNameLabel.font = UIFont(name: "AvenirNext-Bold", size: 15)
        cell.statusLabel.font = UIFont(name: "AvenirNext-Regular", size: 15)
        cell.timeStampLabel.font = UIFont(name: "AvenirNext-Regular", size: 12)
        cell.timeStampLabel.textColor = UIColor.lightGray
    }
}
