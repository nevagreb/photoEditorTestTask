//
//  GiftView.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 22.08.2025.
//

import UIKit

final class GiftView: UIView {
    private let gift: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gift")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let timer: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = .white
        label.text = "00:25:14"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
        animateGift()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        clipsToBounds = true
    }
    
    private func setConstraints() {
        addSubviews(gift, timer)
        gift.translatesAutoresizingMaskIntoConstraints = false
        timer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gift.topAnchor.constraint(equalTo: topAnchor),
            gift.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 31),
            gift.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -31),
            gift.bottomAnchor.constraint(equalTo: timer.topAnchor),
            
            timer.centerXAnchor.constraint(equalTo: centerXAnchor),
            timer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -29)
        ])
        
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }
}

// MARK: - animation
extension GiftView {
    func animateGift() {
        rotate(times: 3)
    }
    
    private func rotate(times: Int) {
        guard times > 0 else {
            
            // pause
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.animateGift()
            }
            return
        }
        
        let rotation = CGAffineTransform(rotationAngle: -.pi/18)
        let duration = 0.15
        
        UIView.animate(withDuration: duration,
                       animations: { [weak self] in
            self?.gift.transform = rotation
        }, completion: { [weak self] _ in
            UIView.animate(withDuration: duration,
                           animations: {
                self?.gift.transform = .identity
            }, completion: { _ in
                self?.rotate(times: times - 1)
            })
        })
    }
}
