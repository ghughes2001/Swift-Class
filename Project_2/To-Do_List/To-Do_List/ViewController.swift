//
//  ViewController.swift
//  To-Do_List
//
//  Created by Grant David Hughes on 7/14/25.
//

import UIKit

class ViewController: UIViewController {
    var task: Task?
    let titleField = UITextField()
    let dueDatePicker = UIDatePicker()
    let prioritySegment = UISegmentedControl(items: Priority.allCases.map { $0.rawValue.capitalized })
    let notesField = UITextView()
    
    init(task: Task? = nil) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = task == nil ? "New Task" : "Edit Task"
        
        setupUI()
        populateIfEditing()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTask))
    }

    func setupUI() {
        titleField.placeholder = "Title"
        titleField.borderStyle = .roundedRect
        dueDatePicker.datePickerMode = .date
        prioritySegment.selectedSegmentIndex = 1
        notesField.layer.borderColor = UIColor.systemGray4.cgColor
        notesField.layer.borderWidth = 1
        notesField.layer.cornerRadius = 6

        let stack = UIStackView(arrangedSubviews: [ titleField, dueDatePicker, prioritySegment, notesField])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            notesField.heightAnchor.constraint(equalToConstant: 120)
        ])
    }

    // MARK: - Populate if Editing
    func populateIfEditing() {
        guard let task = task else { return }
        titleField.text = task.title
        dueDatePicker.date = task.date
        prioritySegment.selectedSegmentIndex = Priority.allCases.firstIndex(of: task.priority) ?? 1
        notesField.text = task.description
    }

    // MARK: - Save
    @objc func saveTask() {
        guard let title = titleField.text, !title.isEmpty else { return }

        let newTask = Task(
            id: task?.id ?? UUID(),
            title: title,
            date: dueDatePicker.date,
            priority: Priority.allCases[prioritySegment.selectedSegmentIndex],
            description: notesField.text ?? "",
            isComplete: task?.isComplete ?? false
        )

        if task != nil {
            Model.share.updateTask(newTask)
        } else {
            Model.share.addTask(newTask)
        }

        navigationController?.popViewController(animated: true)
    }
}
