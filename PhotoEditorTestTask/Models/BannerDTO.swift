//
//  BannerDTO.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 26.08.2025.
//

import Foundation

struct BannerDTO {
    let title: String
    let body: String
    let topLeftBannerImage: String
    let topRightBAnnerImage: String
    let bottomLeftBannerImage: String
    let bottomRightBannerImage: String
    
    static var mockData: Self {
        BannerDTO(title: "Try three days free trial",
                  body: "You will get all premium templates, additional stickers and no ads",
                  topLeftBannerImage: DS.Asset.topLeftBannerImage,
                  topRightBAnnerImage: DS.Asset.topRightBannerImage,
                  bottomLeftBannerImage: DS.Asset.bottomLeftBannerImage,
                  bottomRightBannerImage: DS.Asset.bottomRightBannerImage)
    }
}
