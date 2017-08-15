
final class TweetDetailInteractor {
    
    unowned let presenter: TweetDetailPresenterInteractorType
    let dataManager: TweetDetailDataManagerType
    
    init(presenter: TweetDetailPresenterInteractorType, dataManager: TweetDetailDataManagerType) {
        self.presenter = presenter
        self.dataManager = dataManager
    }
}

protocol TweetDetailInteractorType: class {

}

// MARK: - TweetDetailInteractorType
extension TweetDetailInteractor: TweetDetailInteractorType {

}
