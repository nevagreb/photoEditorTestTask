//  Created by Kristina Grebneva on 22.08.2025.

import UIKit

final class BannerLabel: UILabel {

    override var text: String? { didSet { addSpacing() } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(type: TextType) {
        super.init(frame: .zero)
        switch type {
        case .title:
            font = .systemFont(ofSize: DS.FontSize.bannerTitle, weight: .bold)
            textColor = .white
        case .body:
            font = .systemFont(ofSize: DS.FontSize.bannerBody, weight: .regular)
            textColor = UIColor.white.withAlphaComponent(0.5)
        }
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textAlignment = .left
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
    
    private func addSpacing(_ spacing: CGFloat = 3) {
        guard let text, !text.isEmpty else {
            attributedText = nil
            return
        }
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributedText = NSAttributedString(string: text, attributes: [.paragraphStyle: style])
    }
    
    enum TextType {
        case title, body
    }
}
