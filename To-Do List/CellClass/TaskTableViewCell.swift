//
//  TaskTableViewCell.swift
//  To-Do List
//
//  Created by Kishan Thakkar on 30/05/23.
//

import Foundation
import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var btnCheckMark: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblDeadline: UILabel!
    
}
