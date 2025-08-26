//  Created by Kristina Grebneva on 25.08.2025.

import Foundation

struct Photo {
    let id = UUID()
    let name: String
    
    static var mockData: [Self] {
        return [Photo(name: DS.Asset.photo1),
                Photo(name: DS.Asset.photo2),
                Photo(name: DS.Asset.photo3),
                Photo(name: DS.Asset.photo4),
                Photo(name: DS.Asset.photo5),
                Photo(name: DS.Asset.photo6),
                Photo(name: DS.Asset.photo1),
                Photo(name: DS.Asset.photo2),
                Photo(name: DS.Asset.photo3),
                Photo(name: DS.Asset.photo4),
                Photo(name: DS.Asset.photo5),
                Photo(name: DS.Asset.photo6)]
    }
}
