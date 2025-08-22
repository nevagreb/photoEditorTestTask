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
        static let s: CGFloat = 6
        static let m: CGFloat = 8
    }
    
    enum CornerRadius {
        static let s: CGFloat = 3
        static let m: CGFloat = 12
    }
    
    enum FontSize {
        static let title: CGFloat = 17
        static let body: CGFloat = 13
    }
    
    enum Asset {
        static let topLeftBannerImage = "bannerImage1"
        static let topRightBannerImage = "bannerImage2"
        static let bottomLeftBannerImage = "bannerImage3"
        static let bottomRightBannerImage = "bannerImage4"
    }
}
