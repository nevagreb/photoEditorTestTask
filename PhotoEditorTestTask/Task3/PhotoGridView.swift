//  Created by Kristina Grebneva on 24.08.2025.

import UIKit

final class PhotoGridView: UIView, UICollectionViewDataSource {
    
    private let hashtagsView = HashtagsView()
    private let collectionView: UICollectionView
    private let layout = PhotoLayout()
    private var lastWidth: CGFloat = 0
    
    private var photos: [Photo] = [] {
        didSet {
            layout.configureHeights(for: photos)
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)
        configure()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width
        let scale = window?.screen.scale ?? UIScreen.main.scale
        let onePixel: CGFloat = 1.0 / scale

        if abs(width - lastWidth) > onePixel {
            lastWidth = width
            layout.configureHeights(for: photos)
            collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    private func configure() {
        backgroundColor = .black
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reusedId)
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
    }
    
    private func setupConstraints() {
        addSubviews(hashtagsView, collectionView)
        
        [hashtagsView, collectionView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            hashtagsView.topAnchor.constraint(equalTo: topAnchor),
            hashtagsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hashtagsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: hashtagsView.bottomAnchor, constant: DS.Padding.l),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCollectionViewCell.reusedId,
            for: indexPath
        ) as? PhotoCollectionViewCell else {
            fatalError("Cannot dequeue PhotoCollectionViewCell")
        }
        
        cell.configure(with: photos[indexPath.row])
        return cell
    }
    
    // MARK: - configure with data
    func configure(with photos: [Photo]) {
        self.photos = photos
    }
}
