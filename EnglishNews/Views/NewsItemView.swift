//
//  NewsItemView.swift
//  EnglishNews
//
//  Created by HE HUALIANG on 12/02/2025.
//

import Foundation
import SwiftUI


    // News Item View
struct NewsItemView: View {
    let item: NewsItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
                // Author Row
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: item.authorImage))
                { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
//                Image(item.authorImage)
//                    .resizable()
//                    .frame(width: 300, height: 150)
//                    .frame(width: 600, height: 300)
                .frame(width: 150, height: 75)
//                    .clipShape(RoundedRectangle(cornerRadius: 8))
                // make the image to spend the whole space

                
                
                    // Title and Description
                Text(item.title)
                    .font(.system(size: 20, weight: .bold))
            }
            

            
            Text(item.description)
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .lineLimit(2)
            
                // Interaction Bar
            HStack {
                // this is comment count
                HStack(spacing: 4) {
//                    Image(systemName: "bubble.left")
//                        .foregroundColor(.secondary)
//                    Text("\(item.commentCount)")
//                        .foregroundColor(.secondary)
//                    Text(item.author)
//                        .font(.system(size: 16, weight: .medium))
                    Text(item.timeAgo)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bookmark")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 8)
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(8)
    }
}

#Preview {
    let newsItems = [
        NewsItem(
            author: "Milo Tanaka",
            authorImage: "https://www.newsinlevels.com/wp-content/uploads/2025/02/Depositphotos_67379811_L-200x100.jpg",
            timeAgo: "6 hours ago",
            title: "City Council Approves New Infrastructure Plan",
            description: "The city council has approved a comprehensive plan to modernize infrastructure across the city...",
            commentCount: 12
        ),
        NewsItem(
            author: "Aria Chen",
            authorImage: "https://www.newsinlevels.com/wp-content/uploads/2024/03/Depositphotos_652851334_L-200x100.jpg",
            timeAgo: "8 hours ago",
            title: "Community Events This Weekend",
            description: "Join us for a range of community events happening this weekend, including festivals, workshops, and...",
            commentCount: 8
        )
    ]
    NewsItemView(item: newsItems[0])
}
