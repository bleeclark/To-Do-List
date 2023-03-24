// Define a Task struct to represent each task
struct Task {
    var name: String
}

// Define a data model to store the list of tasks
var tasks: [Task] = []

// Implement the create new task feature
@IBAction func addTaskButtonTapped(_ sender: UIButton) {
    // Create a UIAlertController to prompt the user to enter a new task
    let alertController = UIAlertController(title: "New Task", message: "Enter a name for the new task:", preferredStyle: .alert)
    
    // Add a text field to the alert controller for the user to enter the task name
    alertController.addTextField { (textField) in
        textField.placeholder = "Task Name"
    }
    
    // Create an "Add" action for the alert controller
    let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
        // Get the text entered by the user
        if let taskName = alertController.textFields?[0].text {
            // Create a new task with the entered name
            let newTask = Task(name: taskName)
            
            // Add the new task to the data model
            tasks.append(newTask)
            
            // Reload the table view to display the new task
            tableView.reloadData()
        }
    }
    
    // Create a "Cancel" action for the alert controller
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    // Add the actions to the alert controller
    alertController.addAction(addAction)
    alertController.addAction(cancelAction)
    
    // Present the alert controller to the user
    present(alertController, animated: true, completion: nil)
}
