//
//  NavigationBarStyle.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation
import SwiftUI

struct NavigationBarStyle {
    static func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(.blue)
        appearance.titleTextAttributes = [.foregroundColor:UIColor(.white),
                                          .font: UIFont(name: "oswald", size: 32)!]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(.white),
                                               .font: UIFont(name: "oswald", size: 32)!]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
