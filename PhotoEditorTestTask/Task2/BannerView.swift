//  Created by Kristina Grebneva on 22.08.2025.

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

        NSLayoutConstraint.activate([
            textStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            textStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textStack.trailingAnchor.constraint(lessThanOrEqualTo: collage.leadingAnchor),
            
            collage.centerYAnchor.constraint(equalTo: centerYAnchor),
            collage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            collage.widthAnchor.constraint(equalToConstant: 98),
            collage.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        textStack.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        collage.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
