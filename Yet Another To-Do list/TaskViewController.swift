//
//  TaskViewController.swift
//  Yet Another To-Do list
//
//  Created by Kamil Zachara on 06/04/2022.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text=task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "delete", style: .done, target: self, action: #selector(deleteTask))
    
    }
    
    @objc func deleteTask(){
//        let newCount = count - 1
//
//        UserDefaults.standard.set(newCount , forKey: "count")
//        UserDefaults.standard.set(nil , forKey: "task_\(currentPosition)")
//
//        tasks.removeAll()
//
//        guard let count = UserDefaults.standard.value(forKey: "count") as? Int else{
//            return
//        }
//
//        for x in 0..<count{
//            if let task = UserDefaults.standard.value(forKey: "task_\(x+1)") as? String{
//                tasks.append(task)
//            }
//        }
//
//        tableView.reloadData()
//
    }
    

}
