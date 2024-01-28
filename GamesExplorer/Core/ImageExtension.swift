//
//  ImageExtension.swift
//  GamesExplorer
//
//  Created by Ademola Fadumo on 27/01/2024.
//

import SwiftUI

extension Image {
  /// Resize an image with fill aspect ratio and specified frame dimensions.
  ///   - parameters:
  ///     - width: Frame width.
  ///     - height: Frame height.
    func resizedToFill(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        contentMode: ContentMode = .fill
    ) -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: contentMode)
      .frame(width: width, height: height)
  }
}
