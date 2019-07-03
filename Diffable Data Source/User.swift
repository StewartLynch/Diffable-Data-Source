//
//  User.swift
//  Diffable Data Source
//
//  Created by Kyle Lee on 7/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import Foundation

struct User: Hashable {
    let name: String
    
    static func newUser(name:String) -> User {
        return User(name: name)
    }
}
