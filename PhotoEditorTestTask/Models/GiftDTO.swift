//  Created by Kristina Grebneva on 26.08.2025.

import Foundation

struct GiftDTO {
    let hours: Int?
    let minutes: Int?
    let seconds: Int?
    
    init(hours: Int? = nil, minutes: Int? = nil, seconds: Int? = nil) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
    static var mockData: GiftDTO {
        return GiftDTO(minutes: 30)
    }
}
