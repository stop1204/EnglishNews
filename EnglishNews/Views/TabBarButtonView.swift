//
//  TabBarButton.swift
//  EnglishNews
//
//  Created by HE HUALIANG on 15/02/2025.
//

import SwiftUI

// MARK: - TabBarButton
struct TabBarButtonView: View {
        // -------- Properties --------
    
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
        // -------- Content Properties --------
    let gradients = [LinearGradient(
        colors: [.red, .black],
        startPoint: .top,
        endPoint: .bottomTrailing
    ), LinearGradient(
        colors: [.green, .black],
        startPoint: .top,
        endPoint: .bottomTrailing
    ),LinearGradient(
        colors: [.blue, .black],
        startPoint: .top,
        endPoint: .bottomTrailing
    )]
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .imageScale(.large)
                    //                    .symbolRenderingMode(.palette)
                    //                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(
                        isSelected ? AnyShapeStyle(gradients[Int.random(in: 0...2)]) : AnyShapeStyle(.gray)
                    )
                    //                    .foregroundColor(isSelected ? .red : .gray)
                Text(title)
                    .font(.system(size: 12))
                    .foregroundStyle(isSelected ? AnyShapeStyle(gradients[Int.random(in: 0...2)]) : AnyShapeStyle(.gray))
            }
        }
    }
    
}

#Preview {
//    TabBarButton()
    HStack {
        Spacer()
        TabBarButtonView(
            title: "Home",
            icon: "square.fill.text.grid.1x2",
            isSelected: true
        ){
            
        }
        Spacer()
        TabBarButtonView(
            title: "Details",
            icon: "text.page.badge.magnifyingglass",
            isSelected: false
        ) {
            
        }
        
        Spacer()
        TabBarButtonView(
            title: "Settings",
            icon: "gearshape",
            isSelected: false
        ) {
            
        }
        Spacer()}
}
