//
//  BannerTextView.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 22.08.2025.
//

import UIKit

final class BannerLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(type: TextType) {
        super.init(frame: .zero)
        switch type {
        case .title:
            font = .systemFont(ofSize: DS.FontSize.title, weight: .bold)
        case .body:
            font = .systemFont(ofSize: DS.FontSize.body, weight: .regular)
            alpha = 0.5
        }
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textAlignment = .left
        textColor = .white
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        adjustsFontSizeToFitWidth = true
        contentScaleFactor = 0.90
    }
    
    enum TextType {
        case title, body
    }
}
