//
//  ViewController.swift
//  Yet Another To-Do list
//
//  Created by Kamil Zachara on 05/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let defaults = UserDefaults.standard
    
    var tasks = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //setup saving
        
        if !defaults.bool(forKey: "setup"){
            defaults.set(true, forKey: "setup")
            defaults.set(0, forKey: "count")
        }
        
        
        //get all saved tasks
        
        updateTasks()
        
    }
    
    func updateTasks(){
        
        tasks.removeAll()
        
        guard let count = defaults.value(forKey: "count") as? Int else{
            return
        }
        
        for x in 0..<count{
            if let task = defaults.value(forKey: "task_\(x+1)") as? String{
                tasks.append(task)
            }
        }
        
        tableView.reloadData()
        
    }
    
    @IBAction func didTapAdd(){
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }

    
}


extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
}

