//
//  NewsArticle.swift
//  EnglishNews
//
//  Created by HE HUALIANG on 15/02/2025.
//


import SwiftUI

struct NewsArticle: Codable {
    let image_url: String
    let date: String
    let body: String
    let difficult_words: [String: String]
    let cached_at: String
}