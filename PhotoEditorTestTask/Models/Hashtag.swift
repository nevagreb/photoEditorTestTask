//  Created by Kristina Grebneva on 25.08.2025.

import Foundation

struct Hashtag {
    let id = UUID()
    let text: String
    
    static var mockData: [Self] {
        var hashtags: [Hashtag] = []
        DS.Hashtag.titles.forEach { hashtags.append(Hashtag(text: "#\($0)")) }
        return hashtags
    }
}
