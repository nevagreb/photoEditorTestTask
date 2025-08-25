//
//  BannerDesignSystem.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 22.08.2025.
//

import Foundation

struct DS {
    static let borderWidth: CGFloat = 2
    
    enum Padding {
        static let xs: CGFloat = 4
        static let s: CGFloat = 6
        static let m: CGFloat = 8
        static let l: CGFloat = 12
        static let xl: CGFloat = 15
    }
    
    enum CornerRadius {
        static let s: CGFloat = 3
        static let m: CGFloat = 12
        static let l: CGFloat = 14
    }
    
    enum FontSize {
        static let hashTag: CGFloat = 11
        static let hashTagTitle: CGFloat = 12
        static let bannerBody: CGFloat = 13
        static let bannerTitle: CGFloat = 17
        static let giftFont: CGFloat = 22
    }
    
    enum Asset {
        static let topLeftBannerImage = "bannerImage1"
        static let topRightBannerImage = "bannerImage2"
        static let bottomLeftBannerImage = "bannerImage3"
        static let bottomRightBannerImage = "bannerImage4"
        static let gift = "gift"
    }
    
    enum GiftContainerSizes {
        static let minW: CGFloat = 140
        static let maxW: CGFloat = 200
    }
    
    enum LayoutConstants {
        static let defaultItemHeight: CGFloat = 180
    }
    
}
