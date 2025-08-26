//  Created by Kristina Grebneva on 26.08.2025.

import Foundation

// Data abstraction for the screen
protocol NetworkService {
    func fetchBanner() -> BannerDTO
    func fetchGift() -> GiftDTO
    func fetchPhotos() -> [Photo]
    func fetchHashtags() -> [Hashtag]
}

// Mock implementation: returns static stub data immediately
final class MockNetworkService: NetworkService {

    func fetchBanner() -> BannerDTO {
        return BannerDTO.mockData
    }
    
    func fetchGift() -> GiftDTO {
        return GiftDTO.mockData
    }
    
    func fetchPhotos() -> [Photo] {
        return Photo.mockData
    }
    
    func fetchHashtags() -> [Hashtag] {
        return Hashtag.mockData
    }
}
