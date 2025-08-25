//
//  PhotoGridViewController.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 24.08.2025.
//

import UIKit

final class PhotoGridViewController: UIViewController {
    
    private var hashTagsView = HashtagScrollView()
    private var photos: [Photo] = []
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionView()
        setupConstraints()
        loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let layout = collectionView.collectionViewLayout as? PhotoLayout {
            layout.configureHeights(for: photos)
        }
    }
    
    private func configureView() {
        view.backgroundColor = .black
    }
    
    private func configureCollectionView() {
        let layout = PhotoLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reusedId)
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
    }
    
    private func setupConstraints() {
        view.addSubviews(hashTagsView, collectionView)
        
        [hashTagsView, collectionView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            hashTagsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hashTagsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            hashTagsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: hashTagsView.bottomAnchor, constant: DS.Padding.l),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - load data
    private func loadData() {
        photos += Photo.mockData() + Photo.mockData()
    }
}

extension PhotoGridViewController: UICollectionViewDataSource {
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
}
