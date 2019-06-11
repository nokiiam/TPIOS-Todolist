//
//  TodoItem.swift
//  ToDoList
//
//  Created by romain on 17/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TodoItem: NSObject, NSCopying {
    var itemName: String
    var completed: Bool
    var creationDate : Date
    var color : UIColor
    
    init(itemName:String, color:UIColor = UIColor.white) {
        self.itemName = itemName
        completed = false
        creationDate = Date()
        self.color = color
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let cop = TodoItem(itemName: itemName, color: color)
        cop.completed = completed
        cop.creationDate = creationDate;
        return cop
    }
    
}
