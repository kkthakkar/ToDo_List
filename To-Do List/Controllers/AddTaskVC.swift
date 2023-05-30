//
//  AddTaskVC.swift
//  To-Do List
//
//  Created by Kishan Thakkar on 29/05/23.
//

import Foundation
import UIKit
import iOSDropDown

class AddTaskVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var txtTaskTitle: UITextField!
    @IBOutlet weak var txtTime: DropDown!
    @IBOutlet weak var txtAMPM: DropDown!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    override func viewDidLoad() {
        
        self.setUI()
    }
 
    func setUI() {
        
        self.title = "Add Task"

        txtTime.delegate = self
        txtTime.optionArray = ["01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00"]
        txtTime.didSelect { selectedText, index, id in
            
            self.txtTime.text = selectedText
            self.txtTime.hideList()
        }
        txtAMPM.delegate = self
        txtAMPM.optionArray = ["AM","PM"]
        txtAMPM.didSelect { selectedText, index, id in
            self.txtAMPM.text = selectedText
            self.txtAMPM.hideList()
        }
        
        setBorder(txtTaskTitle)
        setBorder(txtTime)
        setBorder(txtAMPM)
        
        btnCancel.layer.cornerRadius = 20
        btnCancel.layer.borderWidth = 1.0
        btnCancel.layer.borderColor = UIColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1).cgColor

        btnAdd.layer.cornerRadius = 20
    }
    
    func setBorder(_ txtField: UITextField) {
        
        txtField.layer.cornerRadius = 4
        txtField.layer.borderWidth = 1.0
        txtField.layer.borderColor = UIColor.gray.cgColor
    }
    
    //MARK: - Actions

    @IBAction func btnClkAddTask(_ sender: UIButton) {
    
        var strMessage = ""
        var alert = UIAlertController(title: "Alert", message: strMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        guard txtTaskTitle.text?.isEmpty == false else {
            strMessage = "Please enter task title"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard txtTime.text?.isEmpty == false else {
            strMessage = "Please select deadline time"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard txtAMPM.text?.isEmpty == false else {
            strMessage = "Please select time type"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        DispatchQueue.main.async {
            
            let newTask = ToDoItem(title: self.txtTaskTitle.text!, isComplete: false, deadline: "\(self.txtTime.text!) \(self.txtAMPM.text!)")
            addItemToGlobalArray(item: newTask)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func btnClkCancel(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddTaskVC : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == txtTime || textField == txtAMPM {
            
            if textField == txtTime {
                txtTime.showList()
            } else {
                txtAMPM.showList()
            }
            return false
        } else {
            return true
        }

    }
}
