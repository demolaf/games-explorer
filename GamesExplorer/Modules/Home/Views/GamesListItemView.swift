//
//  GamesListItem.swift
//  GamesExplorer
//
//  Created by Ademola Fadumo on 25/01/2024.
//

import SwiftUI

struct GamesListItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("image-placeholder", bundle: .main)
                // TODO: fix the issue with .fill affecting the plus button
                // Guessing the issue is that the next items image is spilling
                // out of bounds and layered above the button making it impossible
                // to tap but this problem doesn't exist with .fit
                .resizedToFill(height: 150, contentMode: .fill)
                .clipped()
            VStack(alignment: .leading, spacing: 16) {
                gameTitle
                gameDetails
                addGameToLibary
            }
            .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(.background)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
        }
    }

    var gameTitle: some View {
        VStack(alignment: .leading) {
            Text("Clash of clans")
                .foregroundStyle(.primary)
                .font(.title)
            Text("By Supercell")
                .foregroundStyle(.gray)
                .font(.callout)
        }
    }

    var gameDetails: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("14+")
                    .foregroundStyle(.primary)
                    .font(.callout)
                Text("Age rating")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("1.2GB+")
                    .foregroundStyle(.primary)
                    .font(.callout)
                Text("Size")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("Eng, +12 more")
                    .foregroundStyle(.primary)
                    .font(.callout)
                Text("Language")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
        }
    }

    var addGameToLibary: some View {
        HStack {
            HStack(spacing: 16) {
                ZStack {
                    ForEach(0..<4) { index in
                        ZStack {
                            Circle()
                                .foregroundStyle(.background)
                            Image("profile-placeholder", bundle: .main)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .background(.primary, in: .circle)
                                .clipShape(Circle())
                                .padding(4)
                        }
                        .frame(width: 28, height: 28)
                        .offset(x: CGFloat(index * 20), y: 0)
                    }
                }
                Spacer()
                Text("Played this game")
                    .foregroundStyle(.primary)
                Spacer()
            }
            Button(action: {
                debugPrint("Add to library button tapped")
            }, label: {
                Circle()
                    .foregroundStyle(.purple)
                    .overlay {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
            })
            .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    GamesListItemView()
}
//
