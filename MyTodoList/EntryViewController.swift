//
//  EntryViewController.swift
//  MyTodoList
//
//  Created by B0218983 on 09/07/20.
//  Copyright © 2020 B0218983. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textField:UITextField!
    @IBOutlet var datePicker:UIDatePicker!
    
    public var completionHandler:((_ todo:Todo) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
        textField.delegate=self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func didTapSaveButton() {
        if let text = textField.text, !text.isEmpty {
            let date = datePicker.date
            let newItem = Todo(title:text,date:date)
            completionHandler?(newItem)
            navigationController?.popToRootViewController(animated: true)
        }
        else {
            print("Add something")
        }
    }

}
