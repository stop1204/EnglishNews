//
//  ContentView.swift
//  EnglishNews
//
//  Created by HE HUALIANG on 05/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
//    this is the sample data
    let newsItems = [
        NewsItem(
            author: "Milo Tanaka",
            authorImage: "profile_milo",
            timeAgo: "6 hours ago",
            title: "City Council Approves New Infrastructure Plan",
            description: "The city council has approved a comprehensive plan to modernize infrastructure across the city...",
            commentCount: 12
        ),
        NewsItem(
            author: "Aria Chen",
            authorImage: "profile_aria",
            timeAgo: "8 hours ago",
            title: "Community Events This Weekend",
            description: "Join us for a range of community events happening this weekend, including festivals, workshops, and...",
            commentCount: 8
        )
    ]
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
        NewsFeedView(newsItems: newsItems)
    }
}


#Preview {
    ContentView()
}
