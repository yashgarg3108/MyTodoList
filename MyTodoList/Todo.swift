//
//  Todo.swift
//  MyTodoList
//
//  Created by B0218983 on 09/07/20.
//  Copyright © 2020 B0218983. All rights reserved.
//

import Foundation

class Todo{
    
    var title:String
    var date:Date
    
    init(title:String,date:Date){
        self.title=title
        self.date=Date()
    }
}
