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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .black
        view.addSubview(hashTagsView)
        hashTagsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hashTagsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            hashTagsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            hashTagsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            hashTagsView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
