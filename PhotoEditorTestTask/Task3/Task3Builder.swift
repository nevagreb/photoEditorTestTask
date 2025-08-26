//  Created by Kristina Grebneva on 26.08.2025.

import UIKit

enum Task3Builder {
    static func build(network: NetworkService = MockNetworkService()) -> UIViewController {
        let vc = Task3ViewController()
        let presenter = Task3Presenter(view: vc, networkService: network)
        vc.presenter = presenter
        return vc
    }
}
