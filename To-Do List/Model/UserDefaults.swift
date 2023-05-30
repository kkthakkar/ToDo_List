//
//  UserDefaults.swift
//  To-Do List
//
//  Created by Kishan Thakkar on 30/05/23.
//

import Foundation
import UIKit

var toDoItems: [ToDoItem] = []

func loadGlobalArray() {
    
    if let data = UserDefaults.standard.data(forKey: "GlobalArray") {
        toDoItems = try! PropertyListDecoder().decode([ToDoItem].self, from: data)
    } else {
        print("Unable to load global array")
    }
}

func saveGlobalArray() {
    
    if let data = try? PropertyListEncoder().encode(toDoItems) {
        UserDefaults.standard.set(data, forKey: "GlobalArray")
    } else {
        print("Unable to save global array")
    }
}

func addItemToGlobalArray(item: ToDoItem) {
    toDoItems.append(item)
    saveGlobalArray() // Call this to save the changes
}
