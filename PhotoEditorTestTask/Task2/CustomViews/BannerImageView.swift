//  Created by Kristina Grebneva on 21.08.2025.

import UIKit

final class BannerImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentMode = .scaleAspectFill
        clipsToBounds = true

        layer.cornerRadius = DS.CornerRadius.radius3
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        layer.borderWidth = DS.borderWidth
        layer.borderColor = UIColor.white.cgColor
    }

}
