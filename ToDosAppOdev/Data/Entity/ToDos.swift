//
//  ToDos.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation

class ToDos : Identifiable {
    var id:Int?
    var name:String?
    
    init(id:Int, name:String) {
        self.id = id
        self.name = name
    }
}
