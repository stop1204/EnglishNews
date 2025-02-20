//
//  NewsFeedView.swift
//  EnglishNews
//
//  Created by HE HUALIANG on 12/02/2025.
//

import SwiftUI

// MARK: - NewsFeedView

// Main News Feed View
struct NewsFeedView: View {
    // -------- SwiftUI Properties --------

    @State private var selectedTab = 0

    // -------- Properties --------

    let newsItems: [NewsItem]

    // -------- Content Properties --------

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // News Feed List
                ScrollView {
                    LazyVStack(spacing: 1) {
                        ForEach(newsItems) { item in
                            NewsItemView(item: item)
                        }
                    }
                }

                // Tab Bar
                HStack {
                    Spacer()
                    TabBarButton(
                        title: "Home",
                        icon: "square.fill.text.grid.1x2",
                        isSelected: selectedTab == 0
                    ) {
                        selectedTab = 0
                    }

                    Spacer()
                    TabBarButton(
                        title: "Details",
                        icon: "text.page.badge.magnifyingglass",
                        isSelected: selectedTab == 1
                    ) {
                        selectedTab = 1
                    }

                    Spacer()
                    TabBarButton(
                        title: "Settings",
                        icon: "gearshape",
                        isSelected: selectedTab == 2
                    ) {
                        selectedTab = 2
                    }
                    Spacer()
                }
                .padding(.vertical, 8)
                .background(Color.white)
                .overlay(
                    Divider()
                        .padding(.bottom, 49),
                    alignment: .top
                )
            }
            .navigationTitle("News Levels")
            .navigationBarItems(
                trailing: Button("See All") {
                    // Handle See All action
                }
                .foregroundColor(.red)
            )
        }
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
        ),
    ]
    NewsFeedView(newsItems: newsItems)
}
