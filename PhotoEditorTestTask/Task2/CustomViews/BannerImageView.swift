//
//  BannerImageView.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 21.08.2025.
//

import UIKit

final class BannerImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(imageName: String) {
        super.init(frame: .zero)
        image = UIImage(named: imageName)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentMode = .scaleAspectFill
        clipsToBounds = true

        layer.cornerRadius = BannerDesignSystem.CornerRadius.small
        layer.cornerCurve = .continuous
        layer.borderWidth = BannerDesignSystem.borderWidth
        layer.borderColor = UIColor.white.cgColor
    }

}
