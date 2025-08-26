//  Created by Kristina Grebneva on 21.08.2025.

import UIKit

protocol Task3Displaying: AnyObject {
    func showBanner(banner: BannerDTO)
    func showPhotos(_ photos: [Photo])
    func showHashtags(_ hashtags: [Hashtag])
    func showGift(gift: GiftDTO)
}

// UIKit screen. Handles layout only, data-loading logic is in the presenter
final class Task3ViewController: UIViewController, Task3Displaying {
    
    var presenter: Task3Presenting!

    private let bannerView = BannerView()
    private let photoGridView = PhotoGridView()
    private let giftView = GiftView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupConstraint()
        presenter.viewDidLoad()
    }
    
    private func setupConstraint() {
        view.addSubviews(bannerView, photoGridView, giftView)
        
        [bannerView, photoGridView, giftView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: DS.LayoutConstants.bannerStandartHeight),
            
            photoGridView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: DS.Padding.padding15),
            photoGridView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoGridView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoGridView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            giftView.trailingAnchor.constraint(equalTo: photoGridView.trailingAnchor),
            giftView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            giftView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
        ])
    }
    
    func showBanner(banner: BannerDTO) {
        bannerView.configure(with: banner)
    }
    
    func showPhotos(_ photos: [Photo]) {
        photoGridView.setPhotos(photos)
    }
    
    func showHashtags(_ hashtags: [Hashtag]) {
        photoGridView.setHashtags(hashtags)
    }
    
    func showGift(gift: GiftDTO) {
        giftView.configure(with: gift)
    }
}



