//
//  ViewController.swift
//  MyTodoList
//
//  Created by B0218983 on 09/07/20.
//  Copyright © 2020 B0218983. All rights reserved.
//

import UIKit

class ViewController:UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var table:UITableView!
   
    var data:[Todo]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource=self
           // Do any additional setup after loading the view.
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text=data[indexPath.row].title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("Selected")
        
        let todo = data[indexPath.row]
        guard let itemVC = storyboard?.instantiateViewController(identifier: "view") as? ItemViewController else {return}
        
        print("Enter:\(itemVC)")
        itemVC.todo = todo
        
        itemVC.deletionHandler = { (myTodo:Todo) -> Void in
            self.data.remove(at: indexPath.row)
            self.refresh()
        }
        
        navigationController?.pushViewController(itemVC, animated: true)

    
    }
    
    @IBAction func didTapAddButton(){
        
        guard let vc = storyboard?.instantiateViewController(identifier: "enter") as? EntryViewController else {
                  return
              }
        
        print("Enter:\(vc)")
        
        vc.completionHandler = { (todo:Todo) -> Void in
            self.data.append(todo)
            self.refresh()
            
        }
              vc.title = "New Item"
              vc.navigationItem.largeTitleDisplayMode = .never
              navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func refresh() {
           table.reloadData()
       }
    
}

