//  Created by Kristina Grebneva on 21.08.2025.

import UIKit

final class CollageView: UIView {
    
    private let topLeftImageView = BannerImageView()
    private let topRightImageView = BannerImageView()
    private let bottomLeftImageView = BannerImageView()
    private let bottomRightImageView = BannerImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(topLeftImageView, topRightImageView, bottomLeftImageView, bottomRightImageView)
        
        topLeftImageView.translatesAutoresizingMaskIntoConstraints = false
        topRightImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomRightImageView.translatesAutoresizingMaskIntoConstraints = false
            
        let padding = DS.Padding.padding6
        NSLayoutConstraint.activate([
            topLeftImageView.topAnchor.constraint(equalTo: topAnchor),
            topLeftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLeftImageView.bottomAnchor.constraint(equalTo: bottomLeftImageView.topAnchor, constant: -padding),
            topLeftImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -0.5*padding),
            
            topRightImageView.topAnchor.constraint(equalTo: topAnchor),
            topRightImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topRightImageView.leadingAnchor.constraint(equalTo: topLeftImageView.trailingAnchor, constant: padding),
            topRightImageView.heightAnchor.constraint(equalTo: topRightImageView.widthAnchor, multiplier: 0.5),

            bottomLeftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLeftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLeftImageView.trailingAnchor.constraint(equalTo: bottomRightImageView.leadingAnchor, constant: -padding),
            bottomLeftImageView.heightAnchor.constraint(equalTo: bottomLeftImageView.widthAnchor, multiplier: 0.5),
            
            bottomRightImageView.topAnchor.constraint(equalTo: topRightImageView.bottomAnchor, constant: padding),
            bottomRightImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomRightImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomRightImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -0.5*padding)
        ])
    }
    
    // MARK: - configure with data
    func configure(topLeftImage: String,
                   topRightImage: String,
                   bottomLeftImage: String,
                   bottomRightImageL: String) {
        self.topLeftImageView.image = UIImage(named: topLeftImage)
        self.topRightImageView.image = UIImage(named: topRightImage)
        self.bottomLeftImageView.image = UIImage(named: bottomLeftImage)
        self.bottomRightImageView.image = UIImage(named: bottomRightImageL)
    }
}



