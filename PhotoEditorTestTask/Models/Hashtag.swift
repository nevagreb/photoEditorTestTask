//  Created by Kristina Grebneva on 25.08.2025.

import Foundation

struct Hashtag {
    let id = UUID()
    let text: String
    
    static var mockData: [Self] {
        return [Hashtag(text: "#Осень"),
                Hashtag(text: "#Портрет"),
                Hashtag(text: "#Insta-стиль"),
                Hashtag(text: "#Люди"),
                Hashtag(text: "#Природа"),
                Hashtag(text: "#Кофе"),
                Hashtag(text: "#Горы")]
    }
}
