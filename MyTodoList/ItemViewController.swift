//
//  ItemViewController.swift
//  MyTodoList
//
//  Created by B0218983 on 09/07/20.
//  Copyright © 2020 B0218983. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    public var todo:Todo?
    public var deletionHandler: ((_ myTodo:Todo)->Void)?
    
    @IBOutlet var itemLabel:UILabel!
    @IBOutlet var dateLabel:UILabel!
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemLabel.text = todo?.title
        dateLabel.text = Self.dateFormatter.string(from: todo!.date)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))

        // Do any additional setup after loading the view.
    }
    
    @objc private func didTapDelete() {
         guard let myTodo = self.todo else {
             return
         }

         deletionHandler?(myTodo)
         navigationController?.popToRootViewController(animated: true)
     }

}


