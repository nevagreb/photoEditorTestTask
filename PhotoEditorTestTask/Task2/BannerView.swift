//
//  BannerView.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 22.08.2025.
//

import UIKit

final class BannerView: UIView {
    
    private let textStack = UIStackView()
    private let collage = CollageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBannerView()
        configureTextStack()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBannerView() {
        backgroundColor = .bannerBackground
        layer.cornerRadius = DS.CornerRadius.m
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        clipsToBounds = true
    }
    
    private func configureTextStack() {
        let titleLabel = BannerLabel(type: .title)
        titleLabel.text = "Try three days free trial"
        let bodyLabel = BannerLabel(type: .body)
        bodyLabel.text = "You will get all premium templates, additional stickers and no ads"
        
        textStack.addArrangedSubview(titleLabel)
        textStack.addArrangedSubview(bodyLabel)
        textStack.axis = .vertical
        textStack.spacing = DS.Padding.m
    }
    
    private func setConstraints() {
        addSubviews(textStack, collage)
        textStack.translatesAutoresizingMaskIntoConstraints = false
        collage.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingPad = UILayoutGuide()
        let trailingPad = UILayoutGuide()
        let topPad = UILayoutGuide()
        let bottomPad = UILayoutGuide()
        addLayoutGuide(leadingPad)
        addLayoutGuide(trailingPad)
        addLayoutGuide(topPad)
        addLayoutGuide(bottomPad)

        NSLayoutConstraint.activate([
            leadingPad.leadingAnchor.constraint(equalTo: leadingAnchor),
            leadingPad.topAnchor.constraint(equalTo: topAnchor),
            leadingPad.bottomAnchor.constraint(equalTo: bottomAnchor),
            leadingPad.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05),

            trailingPad.trailingAnchor.constraint(equalTo: trailingAnchor),
            trailingPad.topAnchor.constraint(equalTo: topAnchor),
            trailingPad.bottomAnchor.constraint(equalTo: bottomAnchor),
            trailingPad.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05),

            topPad.topAnchor.constraint(equalTo: topAnchor),
            topPad.leadingAnchor.constraint(equalTo: leadingAnchor),
            topPad.trailingAnchor.constraint(equalTo: trailingAnchor),
            topPad.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),   

            bottomPad.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomPad.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomPad.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomPad.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),

            textStack.leadingAnchor.constraint(equalTo: leadingPad.trailingAnchor),
            textStack.topAnchor.constraint(greaterThanOrEqualTo: topPad.bottomAnchor),
            textStack.bottomAnchor.constraint(lessThanOrEqualTo: bottomPad.topAnchor),
            textStack.centerYAnchor.constraint(equalTo: centerYAnchor),

            collage.trailingAnchor.constraint(equalTo: trailingPad.leadingAnchor),
            collage.topAnchor.constraint(greaterThanOrEqualTo: topPad.bottomAnchor),
            collage.bottomAnchor.constraint(lessThanOrEqualTo: bottomPad.topAnchor),
            collage.centerYAnchor.constraint(equalTo: centerYAnchor),

            textStack.trailingAnchor.constraint(equalTo: collage.leadingAnchor, constant: -DS.Padding.m),
            collage.heightAnchor.constraint(equalTo: collage.widthAnchor, multiplier: 0.81)
        ])
        
        textStack.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        collage.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
