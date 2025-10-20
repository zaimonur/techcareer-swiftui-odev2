//
//  TabBar.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomePageScreen()
                .tabItem {
                    Image(systemName: "house")
                }
            SaveScreen()
                .tabItem {
                    Image(systemName: "plus.app")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    TabBar()
}
