//
//  ViewController.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 21.08.2025.
//

import UIKit

class ViewController: UIViewController {

    //var banner = BannerView()
    let gift = GiftView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        view.addSubview(banner)
//        banner.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            banner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            banner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            banner.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13)
//        ])
        
        view.addSubview(gift)
        gift.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gift.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gift.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gift.widthAnchor.constraint(equalToConstant: 190),
            gift.heightAnchor.constraint(equalToConstant: 190)

        ])
    }
}


