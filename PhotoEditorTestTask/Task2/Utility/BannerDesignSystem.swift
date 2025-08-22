//
//  BannerDesignSystem.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 22.08.2025.
//

import Foundation

struct BannerDesignSystem {
    static let borderWidth: CGFloat = 2
    
    enum Padding {
        static let small: CGFloat = 6
        static let medium: CGFloat = 8
    }
    
    enum CornerRadius {
        static let small: CGFloat = 3
        static let medium: CGFloat = 12
    }
    
    enum FontSize {
        static let title: CGFloat = 17
        static let body: CGFloat = 13
    }
    
    enum ImageName {
        static let topLeftImage = "bannerImage1"
        static let topRightImage = "bannerImage2"
        static let bottomLeftImage = "bannerImage3"
        static let bottomRightImage = "bannerImage4"
    }
}
