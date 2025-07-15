//
//  TaskListView.swift
//  To-Do_List
//
//  Created by Grant David Hughes on 7/15/25.
//

import UIKit

class TaskListView: UITableViewController {
    var tasks: [Task] {
        Model.share.tasks
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "To Do List"
        
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask));tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
    }
    
    @objc func addTask() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        
        config.text = task.title
        config.secondaryText = task.isComplete ? "✓ Completed" : "Due: \(formattedDate(task.date))"
        cell.contentConfiguration = config
        cell.accessoryType = task.isComplete ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController(task: tasks[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let task = tasks[indexPath.row]
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
            Model.share.removeTask(task)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        let complete = UIContextualAction(style: .normal, title: "Toggle") { _, _, completion in Model.share.taskCompleted(task)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        return UISwipeActionsConfiguration(actions: [delete, complete])
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
