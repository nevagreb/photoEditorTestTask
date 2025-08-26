//  Created by Kristina Grebneva on 22.08.2025.

import Foundation

struct DS {
    static let borderWidth: CGFloat = 2
    
    enum Padding {
        static let padding4: CGFloat = 4
        static let padding6: CGFloat = 6
        static let padding8: CGFloat = 8
        static let padding12: CGFloat = 12
        static let padding15: CGFloat = 15
        static let padding19: CGFloat = 19
        static let padding20: CGFloat = 20
    }
    
    enum TextSpacing {
        static let small: CGFloat = 3
    }
    
    enum CornerRadius {
        static let radius3: CGFloat = 3
        static let radius12: CGFloat = 12
        static let radius14: CGFloat = 14
    }
    
    enum FontSize {
        static let hashTag: CGFloat = 11
        static let hashTagTitle: CGFloat = 12
        static let bannerBody: CGFloat = 13
        static let bannerTitle: CGFloat = 17
        static let giftFont: CGFloat = 22
    }
    
    enum BannerText {
        static let title: String = "Try three days free trial"
        static let body: String = "You will get all premium templates, additional stickers and no ads"
    }
    
    enum Hashtag {
        static let titles: [String] = ["Осень", "Портрет", "Insta-стиль", "Люди", "Природа", "Кофе", "Горы"]
    }
    
    enum Asset {
        static let gift = "gift"
        static let photo1 = "photo1"
        static let photo2 = "photo2"
        static let photo3 = "photo3"
        static let photo4 = "photo4"
        static let photo5 = "photo5"
        static let photo6 = "photo6"
        static let topLeftBannerImage = "bannerImage1"
        static let topRightBannerImage = "bannerImage2"
        static let bottomLeftBannerImage = "bannerImage3"
        static let bottomRightBannerImage = "bannerImage4"
    }
    
    enum LayoutConstants {
        static let defaultItemHeight: CGFloat = 180
        static let giftStandartHeight: CGFloat = 168
        static let collageStandartWidth: CGFloat = 98
        static let collageStandartHeight: CGFloat = 80
        static let bannerStandartHeight: CGFloat = 108
    }
}
