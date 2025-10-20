//
//  ToDoListItem.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation
import SwiftUI

struct ToDoListItem : View{
    
    var toDo: ToDos
    
    var body: some View{
        HStack{
            Text(toDo.name!)
                .foregroundStyle(.black)
        }.padding(.vertical,8)
    }
}
