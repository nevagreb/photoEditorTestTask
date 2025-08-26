//  Created by Kristina Grebneva on 26.08.2025.

import Foundation

protocol Task3Presenting: AnyObject {
    func viewDidLoad()
}

final class Task3Presenter: Task3Presenting {
    private weak var view: Task3Displaying?
    private let networkService: NetworkService
    
    init(view: Task3Displaying? = nil, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }
    
    func viewDidLoad() {
        let banner = networkService.fetchBanner()
        let photos = networkService.fetchPhotos()
        let gift = networkService.fetchGift()
        let hashtags = networkService.fetchHashtags()
        
        view?.showBanner(banner: banner)
        view?.showPhotos(photos)
        view?.showGift(gift: gift)
        view?.showHashtags(hashtags)
    }
}
