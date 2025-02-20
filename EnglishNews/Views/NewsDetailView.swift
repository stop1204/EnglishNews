//
//  NewsDetailView.swift
//  EnglishNews
//
//  Created by HE HUALIANG on 15/02/2025.
//

import SwiftUI

// Data Models
struct NewsArticle: Codable {
    let image_url: String
    let date: String
    let body: String
    let difficult_words: [String: String]
    let cached_at: String
}

struct DifficultWord: Identifiable {
    let id = UUID()
    let word: String
    let definition: String
}

struct NewsDetailView: View {
    let article: NewsArticle
    @State private var showingDifficultWords = false
    @Environment(\.dismiss) private var dismiss
    
        // Format date string
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        if let date = dateFormatter.date(from: article.date) {
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: date)
        }
        return article.date
    }
    
        // Convert difficult words dictionary to array
    private var difficultWordsArray: [DifficultWord] {
        article.difficult_words.map { DifficultWord(word: $0.key, definition: $0.value) }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                    // Header Image
                AsyncImage(url: URL(string: article.image_url)) { phase in
                    switch phase {
                    case .empty:
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                    case .failure:
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 200)
                            .overlay(
                                Image(systemName: "photo.fill")
                                    .foregroundColor(.gray)
                            )
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                        // Date
                    Text(formattedDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                        // Article Body
                    Text(article.body)
                        .font(.body)
                        .lineSpacing(6)
                    
                        // Difficult Words Section
                    if !difficultWordsArray.isEmpty {
                        Button(action: { showingDifficultWords.toggle() }) {
                            HStack {
                                Text("Difficult Words")
                                    .font(.headline)
                                Spacer()
                                Image(systemName: showingDifficultWords ? "chevron.up" : "chevron.down")
                            }
                            .padding(.vertical, 8)
                        }
                        
                        if showingDifficultWords {
                            VStack(alignment: .leading, spacing: 12) {
                                ForEach(difficultWordsArray) { word in
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(word.word)
                                            .font(.subheadline)
                                            .fontWeight(.medium)
                                        Text(word.definition)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                            .padding(.leading)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                        // Share article action
                }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
}

#Preview {
    NewsDetailView(article:   NewsArticle(
        image_url: "https://www.newsinlevels.com/wp-content/uploads/2024/02/Depositphotos_167618616_L.jpg",
        date: "12-02-2024 15:00",
        body: "Paris wants to make the city greener for the Olympics in 2024. They are making SUV parking more expensive. SUVs are large strong cars. They are very popular nowadays.\n\nFew people vote on this. SUVs may pay more for parking. People say that big cars pollute more. Also, they use too much space. People should use bikes or trains. But some people say that it is too expensive to stop using cars.\n\nParis leaders consider this vote. They want car makers to make smaller cars.",
        difficult_words: [
            "vote": "to formally choose between two or more things, people, and so on",
            "pollute": "to make the air, water, or soil dirty",
            "consider": "to think something through"
        ],
        cached_at: "2025-02-12T15:13:39.725039"
    ))
}
