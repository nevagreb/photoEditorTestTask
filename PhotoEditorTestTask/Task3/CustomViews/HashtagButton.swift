//  Created by Kristina Grebneva on 25.08.2025.

import UIKit

final class HashtagButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitleColor(.blueAccent, for: .normal)
        titleLabel?.font = .systemFont(ofSize: DS.FontSize.hashTag, weight: .semibold)
        contentEdgeInsets = UIEdgeInsets(top: DS.Padding.padding6, left: DS.Padding.padding12, bottom: DS.Padding.padding6, right: DS.Padding.padding12)
        backgroundColor = .blueAccent?.withAlphaComponent(0.15) ?? UIColor.blue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
}
