//  Created by Kristina Grebneva on 26.08.2025.

import Foundation

protocol NetworkService {
    func fetchBanner() -> BannerDTO
    func fetchGift() -> GiftDTO
    func fetchPhotos() -> [Photo]
    func fetchHashtags() -> [Hashtag]
}

final class MockNetworkService: NetworkService {

    func fetchBanner() -> BannerDTO {
        return BannerDTO.mockData
    }
    
    func fetchGift() -> GiftDTO {
        return GiftDTO.mockData
    }
    
    func fetchPhotos() -> [Photo] {
        Photo.mockData
    }
    
    func fetchHashtags() -> [Hashtag] {
        Hashtag.mockData
    }
}
