//
//  Item.swift
//  Todoey
//
//  Created by Simuel Henderson on 3/25/19.
//  Copyright © 2019 Simuel Henderson. All rights reserved.
//

import Foundation

class Item{
    var title: String
    var done: Bool = false
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
