//
//  ViewController.swift
//  SaveListSample2
//
//  Created by Jazilul Athoya on 14/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var taskTableView: UITableView!
    
    var taskList: [Task] = [] {
        didSet {
            taskTableView.reloadData()
        }
    }
    
    var helper : CoreDataHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //reload taskList tapi ga pake generic
        //taskList = Task.fetchAll(context: getViewContext())
        
        //reload taskList pake generic, via helper data
        helper = CoreDataHelper(context: getViewContext())
        taskList = helper.fetchAll() //dia langsung fetch ke tipe "Task" bukan "SubTask", karena taskList bertipe "Task"
        
        //panggil tableView
        taskTableView.dataSource = self
        
        //buat liat path di hp/laptop
        //print(Bundle.main.bundlePath)
    }
    
    @IBAction func save(_ sender: Any) {
        if let newTask = Task.saveTask(context: getViewContext(), taskName: taskTextField.text ?? ""){
            taskTextField.text = ""
            taskList.append(newTask)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        Task.deleteAll(context: getViewContext())
        taskList.removeAll()
        //getViewContext().delete(taskList[0]) // untuk specific
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count //new
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskList[indexPath.row].taskName //new
        return cell
    }
    
}
