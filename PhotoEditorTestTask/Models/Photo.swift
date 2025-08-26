//  Created by Kristina Grebneva on 25.08.2025.

import Foundation

struct Photo {
    let id = UUID()
    let name: String
    
    static var mockData: [Self] {
        return [Photo(name: "photo1"),
                Photo(name: "photo2"),
                Photo(name: "photo3"),
                Photo(name: "photo4"),
                Photo(name: "photo5"),
                Photo(name: "photo6"),
                Photo(name: "photo1"),
                Photo(name: "photo2"),
                Photo(name: "photo3"),
                Photo(name: "photo4"),
                Photo(name: "photo5"),
                Photo(name: "photo6")]
    }
}
