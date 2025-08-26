//  Created by Kristina Grebneva on 24.08.2025.

import UIKit

final class PhotoGridView: UIView, UICollectionViewDataSource, PhotoLayoutDelegate {
    
    private let hashtagsView = HashtagsView()
    private let collectionView: UICollectionView
    private let layout = PhotoLayout()
    
    private let aspectCache = NSCache<NSString, NSNumber>()

    private var photos: [Photo] = [] {
        didSet {
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
    
    private func configure() {
        backgroundColor = .black
        aspectCache.countLimit = 1000
        layout.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reusedId)
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
    
    // MARK: - PhotoLayoutDelegate
    // func returns photo aspectRatio and caches it
    func collectionView(_ collectionView: UICollectionView,
                            layout: PhotoLayout,
                            aspectRatioForItemAt indexPath: IndexPath) -> CGFloat {
            let name = photos[indexPath.item].name as NSString

            if let cached = aspectCache.object(forKey: name) {
                return CGFloat(truncating: cached)
            }
            guard let img = UIImage(named: name as String), img.size.width > 0 else {
                return 1
            }
            let ratio = img.size.height / img.size.width
            aspectCache.setObject(NSNumber(value: Double(ratio)), forKey: name)
            return ratio
        }
    
    // MARK: - configure with data
    @MainActor
    func setPhotos(_ photos: [Photo]) {
        aspectCache.removeAllObjects()
        self.photos = photos
    }
}
