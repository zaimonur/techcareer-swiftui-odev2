//
//  CustomTextfieldStyle.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation
import SwiftUI

struct CustomTextfieldStyle : TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 4)
            .stroke(.blue,lineWidth: 1))
        
    }
}
