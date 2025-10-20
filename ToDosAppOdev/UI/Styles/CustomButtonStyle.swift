//
//  CustomButtonStyle.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation
import SwiftUI

struct CustomButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(8)
    }
}
