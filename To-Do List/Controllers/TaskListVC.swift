//
//  TaskListVC.swift
//  To-Do List
//
//  Created by Kishan Thakkar on 29/05/23.
//

import UIKit

class TaskListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    func setupUI() {
        
        //Set Navigatoin Title of Screen
        self.title = "Task List"
        
        //Set tableview border
        tableView.layer.cornerRadius = 4
        tableView.layer.borderWidth = 1.0
        tableView.layer.borderColor = UIColor.lightGray.cgColor

        //Tableview datasource and delegate
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func btnClkAddNewTask(_ sender: UIButton) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddTaskVC") as! AddTaskVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func deleteItem(at index: Int) {
    }
    
    @objc func btnClkCheckmark(sender: UIButton){

        let selectedToDoItem = toDoItems[sender.tag]
        // Toggle the completion status
        toDoItems[sender.tag].isComplete = !selectedToDoItem.isComplete
        saveGlobalArray()
        tableView.reloadData()
    }

    @objc func btnClkDelete(sender: UIButton){
       
        let alert = UIAlertController(title: "Warning", message: "Do you want to delete “\(toDoItems[sender.tag].title)”, this action can’t be undone.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
            
            toDoItems.remove(at: sender.tag)
            saveGlobalArray()
            self.tableView.reloadData()
        }))

        self.present(alert, animated: true, completion: nil)
    }

    
    // MARK: - Sorting and Filtering
    
    func sortListByDeadline() {
        toDoItems.sort { $0.deadline < $1.deadline }
        tableView.reloadData()
    }

    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! TaskTableViewCell
        
        let toDoItem = toDoItems[indexPath.row]
  
        cell.lblTitle.text = toDoItem.title
        cell.lblStatus.isHidden = true
        cell.lblTitle.strikeThrough(toDoItem.isComplete)
        cell.btnCheckMark.isSelected = toDoItem.isComplete
        cell.btnCheckMark.tag = indexPath.row
        cell.btnCheckMark.addTarget(self, action: #selector(btnClkCheckmark(sender:)), for: .touchUpInside)
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(btnClkDelete(sender:)), for: .touchUpInside)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
}

