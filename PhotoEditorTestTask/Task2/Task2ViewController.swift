//  Task2ViewController.swift

import UIKit

final class Task2ViewController: UIViewController {

    let banner = BannerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(banner)
        banner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            banner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            banner.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            banner.heightAnchor.constraint(equalToConstant: 108)
        ])
    }

}
