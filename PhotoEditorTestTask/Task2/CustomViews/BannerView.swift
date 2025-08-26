//  Created by Kristina Grebneva on 22.08.2025.

import UIKit

final class BannerView: UIView {
    
    private let textStack = UIStackView()
    private let titleLabel = BannerLabel(type: .title)
    private let bodyLabel = BannerLabel(type: .body)
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
        layer.cornerRadius = DS.CornerRadius.radius12
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        clipsToBounds = true
    }
    
    private func configureTextStack() {
        textStack.addArrangedSubview(titleLabel)
        textStack.addArrangedSubview(bodyLabel)
        textStack.axis = .vertical
        textStack.spacing = DS.Padding.padding8
    }
    
    private func setConstraints() {
        addSubviews(textStack, collage)
        textStack.translatesAutoresizingMaskIntoConstraints = false
        collage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            textStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DS.Padding.padding20),
            textStack.trailingAnchor.constraint(lessThanOrEqualTo: collage.leadingAnchor),
            
            collage.centerYAnchor.constraint(equalTo: centerYAnchor),
            collage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DS.Padding.padding19),
            collage.widthAnchor.constraint(equalToConstant: DS.LayoutConstants.collageStandartWidth),
            collage.heightAnchor.constraint(equalToConstant: DS.LayoutConstants.collageStandartHeight),
        ])
        
        textStack.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        collage.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    // MARK: - configure with data
    func configure(with banner: BannerDTO) {
        titleLabel.text = banner.title
        bodyLabel.text = banner.body
        collage.configure(topLeftImage: banner.topLeftBannerImage,
                          topRightImage: banner.topRightBAnnerImage,
                          bottomLeftImage: banner.bottomLeftBannerImage,
                          bottomRightImageL: banner.bottomRightBannerImage)
    }
}
