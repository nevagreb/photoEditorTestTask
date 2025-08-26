//  Created by Kristina Grebneva on 21.08.2025.

import UIKit

final class Task3ViewController: UIViewController {
    
    private let bannerView = BannerView()
    private let photoGridView = PhotoGridView()
    private let giftView = GiftView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupConstraint()
    }
    
    private func setupConstraint() {
        view.addSubview(bannerView)
        view.addSubview(photoGridView)
        view.addSubview(giftView)
        
        [bannerView, photoGridView, giftView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 108),

            photoGridView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: DS.Padding.xl),
            photoGridView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoGridView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoGridView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            giftView.trailingAnchor.constraint(equalTo: photoGridView.trailingAnchor),
            giftView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            giftView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
        ])
    }
}


