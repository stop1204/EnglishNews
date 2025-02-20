import Combine
import Foundation
import SwiftSoup

class ArticleCache {
    // -------- Properties --------

    private let cacheFile = "article_cache.json"
    private var cache: [String: NewsArticle] = [:]

    // -------- Lifecycle --------

    init() {
        loadCache()
    }

    // -------- Functions --------

    func getArticle(titleLink: String) -> NewsArticle? {
        cache[titleLink]
    }

    func addArticle(titleLink: String, articleData: NewsArticle) {
        cache[titleLink] = articleData
        saveCache()
        debugPrint("Article added to cache")
    }

    private func loadCache() {
        // Load from UserDefaults or file
        do{
            let file_exists = FileManager.default.fileExists(atPath: NSTemporaryDirectory() + cacheFile)
            if file_exists {
                let data = try! Data(contentsOf: URL(fileURLWithPath: NSTemporaryDirectory() + cacheFile))
//                if let loaded = try? JSONSerialization.jsonObject(with: data) as? [String: NewsArticle] {
//                    cache = loaded
//                }
                let decoder = JSONDecoder()
                if let loaded = try? decoder.decode([String: NewsArticle].self, from: data) {
                    cache = loaded
                }
            }
        } catch {
            debugPrint("Failed to load cache: \(error.localizedDescription)")
        }
        debugPrint("Loaded cache Articles")
    }

    private func saveCache() {
//        if let data = try? JSONSerialization.data(withJSONObject: cache) {
//            UserDefaults.standard.set(data, forKey: cacheFile)
//        }
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(cache)
            try data.write(to: URL(fileURLWithPath: NSTemporaryDirectory() + cacheFile))
        } catch {
            debugPrint("Failed to save cache: \(error.localizedDescription)")
        }
        debugPrint("Saved cache Articles")
    }
}