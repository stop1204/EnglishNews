import Combine
import Foundation
import SwiftSoup

class ArticleListCache {
    // -------- Properties --------

    private let listCacheFile = "article_list_cache.json"
    // struct NewsItem: Identifiable,Hashable {
    //let id = UUID()
//let author: String
//let authorImage: String
//let timeAgo: String
//let title: String
//let description: String
//let commentCount: Int
//let article: NewsArticle?
//}
    private var cache: [NewsItem] = []

    // -------- Lifecycle --------

    init() {
        loadCache()
    }

    // -------- Functions --------

    func getCachedList() -> [NewsItem]? {
//        guard let lastUpdated = cache["last_updated"] as? String,
//              let date = ISO8601DateFormatter().date(from: lastUpdated),
//              Date().timeIntervalSince(date) < 3600, // 1 hour
//              let articles = cache["articles"] as? [[String: Any]] else
//        {
//            debugPrint("Cache expired")
//            return nil
//        }
//        debugPrint("\(articles.count) articles loaded from cache")
//        return articles
        return cache
    }

    func updateCache(articles: [NewsItem]) {
        cache = articles

        saveCache()
        debugPrint("Cache updated List")
    }

    private func loadCache() {
        
        do{
            let file_exists =  FileManager.default.fileExists(atPath: listCacheFile)
            if file_exists {
                let data = try Data(contentsOf: URL(fileURLWithPath: listCacheFile))
//                if let loaded = try JSONSerialization.jsonObject(with: data) as? [NewsItem] {
//                    cache = loaded
//                }
                let decoder = JSONDecoder()
                if let loaded = try? decoder.decode([NewsItem].self, from: data) {
                    cache = loaded
                }

            }
        } catch {
            debugPrint("Failed to load cache: \(error.localizedDescription)")
        }
        debugPrint("Loaded cache List")
    }

    private func saveCache() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(cache)
            try data.write(to: URL(fileURLWithPath: listCacheFile))
        } catch {
            debugPrint("Failed to save cache: \(error.localizedDescription)")
        }
//        if let data = try? JSONSerialization.data(withJSONObject: cache) {
//            UserDefaults.standard.set(data, forKey: listCacheFile)
//        }
        debugPrint( "Saved cache List")
    }
}