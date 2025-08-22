//
//  ViewController.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 21.08.2025.
//

import UIKit

class ViewController: UIViewController {

    var banner = BannerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(banner)
        banner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            banner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            banner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            banner.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13)
        ])
    }
}


