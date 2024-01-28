//
//  HomeView.swift
//  GamesExplorer
//
//  Created by Ademola Fadumo on 25/01/2024.
//

import SwiftUI

enum HomeTabSection: Int {
    case today
    case popular
}

struct Home: View {

    @State private var selectedTab: HomeTabSection = .today

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 36) {
                HStack(spacing: 24) {
                    Button("Today") {
                        selectedTab = .today
                    }
                    .foregroundStyle(selectedTab == .today ? .primary : .secondary)
                    // Control + option + click to open
                    // attributes inspector as a pop up
                    Button("Popular") {
                        selectedTab = .popular
                    }
                    .foregroundStyle(selectedTab == .popular ? .primary : .secondary)
                    Spacer()
                    Button(action: {
                        // TODO: show filter options
                    }, label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    })
                    .font(.system(size: 24))
                }
                .buttonStyle(.plain)
                .font(.system(size: 28, weight: .semibold))
                .padding(.horizontal, 24)
                TabView(selection: $selectedTab) {
                    todayTabSection
                        .tag(HomeTabSection.today)
                    popularTabSection
                        .tag(HomeTabSection.popular)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }

    var todayTabSection: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], spacing: 16) {
                ForEach(0..<10) { index in
                    GamesListItemView()
                        .onTapGesture {
                            debugPrint("Item tapped \(index)")
                        }
                }
            }
            .padding(.horizontal, 16)
        }
    }
    var popularTabSection: some View {
        Text("Hello world")
    }
}

#Preview {
    Home()
}

