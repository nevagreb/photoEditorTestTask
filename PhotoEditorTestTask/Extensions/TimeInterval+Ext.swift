//  Created by Kristina Grebneva on 23.08.2025.

import Foundation

extension TimeInterval {
    func asTimeString() -> String {
        let seconds = Int(max(0, floor(self)))
        let h = seconds/3600
        let m = seconds%3600/60
        let s = seconds%60
        
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
}
