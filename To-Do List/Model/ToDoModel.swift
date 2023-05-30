//
//  File.swift
//  To-Do List
//
//  Created by Kishan Thakkar on 29/05/23.
//

import Foundation

struct ToDoItem: Codable {
    
    var title: String
    var isComplete: Bool
    var deadline: String
}

//class ToDoItem : NSObject, NSCoding{
//
//    var title: String
//    var isComplete: Bool
//    var deadline: String
//
//    init(title: String, isComplete: Bool, deadline: String) {
//        self.title = title
//        self.isComplete = isComplete
//        self.deadline = deadline
//    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(title, forKey: "title")
//        coder.encode(isComplete, forKey: "isComplete")
//        coder.encode(deadline, forKey: "deadline")
//    }
//
//    required convenience init?(coder: NSCoder) {
//        let title = coder.decodeObject(forKey: "title") as! String
//        let isComplete = coder.decodeBool(forKey: "isComplete")
//        let deadline = coder.decodeObject(forKey: "deadline") as! String
//        self.init(title: title, isComplete: isComplete, deadline: deadline)
//    }
//}

