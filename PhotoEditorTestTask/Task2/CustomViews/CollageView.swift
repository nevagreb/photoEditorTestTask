//
//  BannerView.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 21.08.2025.
//

import UIKit

final class CollageView: UIView {
    
    let topLeftImage = BannerImageView(imageName: BannerDesignSystem.ImageName.topLeftImage)
    let topRightImage = BannerImageView(imageName: BannerDesignSystem.ImageName.topRightImage)
    let bottomLeftImage = BannerImageView(imageName: BannerDesignSystem.ImageName.bottomLeftImage)
    let bottomRightImage = BannerImageView(imageName: BannerDesignSystem.ImageName.bottomRightImage)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(topLeftImage, topRightImage, bottomLeftImage, bottomRightImage)
        
        topLeftImage.translatesAutoresizingMaskIntoConstraints = false
        topRightImage.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftImage.translatesAutoresizingMaskIntoConstraints = false
        bottomRightImage.translatesAutoresizingMaskIntoConstraints = false
            
        let padding = BannerDesignSystem.Padding.small
        NSLayoutConstraint.activate([
            topLeftImage.topAnchor.constraint(equalTo: topAnchor),
            topLeftImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLeftImage.bottomAnchor.constraint(equalTo: bottomLeftImage.topAnchor, constant: -padding),
            topLeftImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -0.5*padding),
            
            topRightImage.topAnchor.constraint(equalTo: topAnchor),
            topRightImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            topRightImage.leadingAnchor.constraint(equalTo: topLeftImage.trailingAnchor, constant: padding),
            topRightImage.heightAnchor.constraint(equalTo: topRightImage.widthAnchor, multiplier: 0.5),

            bottomLeftImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLeftImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLeftImage.trailingAnchor.constraint(equalTo: bottomRightImage.leadingAnchor, constant: -padding),
            bottomLeftImage.heightAnchor.constraint(equalTo: bottomLeftImage.widthAnchor, multiplier: 0.5),
            
            bottomRightImage.topAnchor.constraint(equalTo: topRightImage.bottomAnchor, constant: padding),
            bottomRightImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomRightImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomRightImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -0.5*padding)
        ])
    }
}



