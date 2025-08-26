//  Created by Kristina Grebneva on 26.08.2025.

import Foundation

protocol Task3Presenting: AnyObject {
    func viewDidLoad()
}

// Presenter was added to move the data-loading logic out of the view
final class Task3Presenter: Task3Presenting {
    private weak var view: Task3Displaying?
    private let networkService: NetworkService
    
    init(view: Task3Displaying? = nil, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }
    
    // Next step - add real network requests, handle them in async
    // parallel manner to avoid app blocking, add error handler
    // in presenter and view
    func viewDidLoad() {
        
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .userInitiated)
        
        var banner: BannerDTO?
        var photos: [Photo] = []
        var gift: GiftDTO?
        var hashtags: [Hashtag] = []
        
        group.enter()
        queue.async { [weak self] in
            defer { group.leave() }
            guard let self else { return }
            banner = self.networkService.fetchBanner()
        }
        
        group.enter()
        queue.async { [weak self] in
            defer { group.leave() }
            guard let self else { return }
            photos = self.networkService.fetchPhotos()
        }
        
        group.enter()
        queue.async { [weak self] in
            defer { group.leave() }
            guard let self else { return }
            gift = self.networkService.fetchGift()
        }
        
        group.enter()
        queue.async { [weak self] in
            defer { group.leave() }
            guard let self else { return }
            hashtags = self.networkService.fetchHashtags()
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            if let banner { self.view?.showBanner(banner: banner) }
            self.view?.showPhotos(photos)
            if let gift { self.view?.showGift(gift: gift) }
            self.view?.showHashtags(hashtags)
        }
    }
}
