//
//  NewsItem.swift
//  EnglishNews
//
//  Created by HE HUALIANG on 12/02/2025.
//

import Foundation
    // Data Models
struct NewsItem: Identifiable {
    let id = UUID()
    let author: String
    let authorImage: String
    let timeAgo: String
    let title: String
    let description: String
    let commentCount: Int
}
