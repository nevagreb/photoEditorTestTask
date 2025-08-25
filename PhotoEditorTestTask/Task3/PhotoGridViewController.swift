//
//  PhotoGridViewController.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 24.08.2025.
//

import UIKit

final class PhotoGridViewController: UIViewController {
    
    private var hashTagsView = HashtagView()
    private var photos: [String] = []
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionView()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let layout = collectionView.collectionViewLayout as? PhotoLayout else { return }
        layout.itemHeights.removeAll()
        
        let columnWidth = (collectionView.bounds.width - CGFloat(layout.numberOfColumns - 1) * layout.padding) / CGFloat(layout.numberOfColumns)
        
        for (i, name) in photos.enumerated() {
            if let image = UIImage(named: name) {
                let aspect = image.size.height / image.size.width
                let height = columnWidth * aspect
                layout.itemHeights[IndexPath(item: i, section: 0)] = height
            }
        }
        
        layout.invalidateLayout()
    }
    
    private func configureView() {
        view.backgroundColor = .black
    }
    
    private func configureCollectionView() {
        let layout = PhotoLayout()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reusedId)
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
    }
    
    private func setConstraints() {
        view.addSubviews(hashTagsView, collectionView)
        
        [hashTagsView, collectionView].translatesAutoresizingMaskIntoConstraints()
        
        NSLayoutConstraint.activate([
            hashTagsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            hashTagsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            hashTagsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: hashTagsView.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PhotoGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reusedId, for: indexPath) as! PhotoCollectionViewCell
        cell.set(photos[indexPath.row])
        return cell
    } 
}
