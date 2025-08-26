//  Created by Kristina Grebneva on 25.08.2025.

import Foundation

struct Photo {
    let id = UUID()
    let name: String
    
    static func mockData() -> [Self] {
        (1..<6).map { i in
            Photo(name: "photo\(i)")
        }
    }
}
