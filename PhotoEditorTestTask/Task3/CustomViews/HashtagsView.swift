//  Created by Kristina Grebneva on 24.08.2025.

import UIKit

final class HashtagsView: UIView {
    private var label = UILabel()
    private var buttons: [HashtagButton] = []
    private var stack = UIStackView()
    private var scroll = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
        addHashtags()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        label.textColor = .white
        label.font = .systemFont(ofSize: DS.FontSize.hashTagTitle)
        label.textAlignment = .left
        label.text = "Подходит для:"
        
        scroll.showsHorizontalScrollIndicator = false
        
        stack.axis = .horizontal
        stack.spacing = DS.Padding.xs
        stack.alignment = .center
    }
    
    private func setConstraints() {
        addSubviews(label, scroll)
        scroll.addSubview(stack)
        
        [label, scroll, stack].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scroll.topAnchor.constraint(equalTo: label.bottomAnchor, constant: DS.Padding.m),
            scroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stack.leadingAnchor.constraint(equalTo: scroll.contentLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scroll.contentLayoutGuide.trailingAnchor),
            stack.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor),
            
            stack.heightAnchor.constraint(equalTo: scroll.frameLayoutGuide.heightAnchor)
        ])
    }
    
    func addHashtags() {
        buttons.forEach { $0.removeFromSuperview() }
        buttons = (0...15).map {_ in
            let button = HashtagButton()
            button.setTitle("#Осень", for: .normal)
            return button
        }
        buttons.forEach(stack.addArrangedSubview)
    }
}


