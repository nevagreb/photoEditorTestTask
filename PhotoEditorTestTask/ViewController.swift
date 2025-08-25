//
//  ViewController.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 21.08.2025.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        DispatchQueue.main.async {
            let giftVC = GiftViewController()
            giftVC.modalPresentationStyle = .overFullScreen
            giftVC.modalTransitionStyle = .crossDissolve
            self.present(giftVC, animated: true)
        }
    }
}


