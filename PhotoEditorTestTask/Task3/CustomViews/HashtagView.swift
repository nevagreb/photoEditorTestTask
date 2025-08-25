//
//  HashtagView.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 24.08.2025.
//

import UIKit

class HashtagView: UIView {
    private var label = UILabel()
    private var buttons: [UIButton] = []
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stack.layoutIfNeeded()
        buttons.forEach { button in
            if #available(iOS 13.0, *) { button.layer.cornerCurve = .continuous }
            button.layer.cornerRadius = button.bounds.height / 2
            button.clipsToBounds = true
        }
    }
    
    private func configure() {
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .left
        label.text = "Подходит для:"
        
        scroll.showsHorizontalScrollIndicator = false
        
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
    }
    
    private func setConstraints() {
        addSubviews(label, scroll)
        scroll.addSubview(stack)
        
        [label, scroll, stack].translatesAutoresizingMaskIntoConstraints()
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scroll.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
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
            let button = UIButton()
            button.setTitle("#Осень", for: .normal)
            button.setTitleColor(.blueAccent, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 11, weight: .semibold)
            button.contentEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
            button.backgroundColor = .blueAccent?.withAlphaComponent(0.15)
            return button
        }
        buttons.forEach(stack.addArrangedSubview)
    }
}


