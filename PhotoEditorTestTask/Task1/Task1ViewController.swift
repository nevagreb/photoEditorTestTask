//  Created by Kristina Grebneva on 26.08.2025.

import UIKit

final class Task1ViewController: UIViewController {

    let giftView = GiftView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        giftView.configure(with: GiftDTO.mockData)
    }
    
    private func setupConstraints() {
        view.addSubview(giftView)
        
        giftView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            giftView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            giftView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            giftView.widthAnchor.constraint(equalToConstant: DS.LayoutConstants.giftStandartHeight)
        ])
    }
    
}
