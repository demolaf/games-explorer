//
//  Color+Extensions.swift
//  GamesExplorer
//
//  Created by Ademola Fadumo on 27/01/2024.
//

import SwiftUI

extension Color {
    func light() -> Color {
        var environment = EnvironmentValues()
        environment.colorScheme = .light
        return Color(cgColor: self.resolve(in: environment).cgColor)
    }

    func dark() -> Color {
        var environment = EnvironmentValues()
        environment.colorScheme = .dark
        return Color(cgColor: self.resolve(in: environment).cgColor)
    }

    func flipped() -> Color {
        let environment = EnvironmentValues()
        if environment.colorScheme == .dark {
            return self.light()
        }
        return self.dark()
    }
}
