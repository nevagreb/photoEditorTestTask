//  Created by Kristina Grebneva on 21.08.2025.

import UIKit

protocol DataSourceble: AnyObject {
    func getHashtags() -> [Hashtag]
    func getPhotos() -> [Photo]
}

final class Task3ViewController: UIViewController, DataSourceble {
    
    private let bannerView = BannerView()
    private let photoVC = PhotoGridViewController()
    private let giftView = GiftView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureConstraint()
    }
    
    private func setupView() {
        view.backgroundColor = .black
        photoVC.delegate = self
    }
    
    private func configureConstraint() {
        addChild(photoVC)
        view.addSubview(bannerView)
        view.addSubview(photoVC.view)
        view.addSubview(giftView)
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        photoVC.view.translatesAutoresizingMaskIntoConstraints = false
        giftView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bannerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),

            photoVC.view.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: DS.Padding.xl),
            photoVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            giftView.trailingAnchor.constraint(equalTo: photoVC.view.trailingAnchor),
            giftView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            giftView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
        ])
        
        photoVC.didMove(toParent: self)
    }
    
    // MARK: - get data func
    func getHashtags() -> [Hashtag] {
        return Hashtag.mockData()
    }
    
    func getPhotos() -> [Photo] {
        return Photo.mockData() + Photo.mockData()
    }
}


