//
//  Hashtag.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 25.08.2025.
//

import Foundation

struct Hashtag {
    let id = UUID()
    let text: String
    
    static func mockData() -> [Self] {
        (1..<6).map { i in
            Hashtag(text: "Осень")
        }
    }
}
