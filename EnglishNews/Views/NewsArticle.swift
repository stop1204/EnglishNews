import SwiftUI

struct NewsArticle: Codable {
    let image_url: String
    let date: String
    let body: String
    let difficult_words: [String: String]
    let cached_at: String
}