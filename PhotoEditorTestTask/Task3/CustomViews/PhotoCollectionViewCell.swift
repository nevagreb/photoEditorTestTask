//
//  PhotoCollectionViewCell.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 25.08.2025.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let reusedId = "PhotoCell"
    
    let photo = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ photoName: String) {
        photo.image = UIImage(named: photoName)
    }
    
    private func configure() {
        photo.layer.cornerRadius = 14
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFit
        
        contentView.addSubview(photo)
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
