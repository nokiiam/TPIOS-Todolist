//
//  TodoListTableViewController.swift
//  ToDoList
//
//  Created by romain on 17/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    var toDoItems = [TodoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        loadInitialData()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    func loadInitialData(){
        let item1 = TodoItem(itemName: "Buy milk", color: UIColor.red)
        toDoItems.append(item1)
        let item2 = TodoItem(itemName: "Buy eggs", color: UIColor.gray)
        toDoItems.append(item2)
        let item3 = TodoItem(itemName: "Read a book")
        toDoItems.append(item3)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    @IBAction func unwindToList(_ segue:UIStoryboardSegue){
        if let source = segue.source as? AddTodoItemViewController {
            if source.isEdit {
                toDoItems[source.row] = (source.toDoItem!.copy() as? TodoItem)!
                tableView.reloadData()
            }
            else if let item = source.toDoItem {
                toDoItems.append(item)
                tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "I1", for: indexPath)
        if indexPath.row < toDoItems.count {
            let todoItem = toDoItems[indexPath.row]
            cell.textLabel?.text = todoItem.itemName
            cell.backgroundColor = todoItem.color
            if toDoItems[indexPath.row].completed
            {
                cell.accessoryType = .checkmark
            } else
            {
                cell.accessoryType = .none
            }
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = storyboard?.instantiateViewController(withIdentifier: "CreateOrEdit") as! AddTodoItemViewController
        destination.toDoItem = toDoItems[indexPath.row].copy() as? TodoItem
        destination.isEdit = true
        destination.row = indexPath.row;
        navigationController?.pushViewController(destination, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            toDoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let rowToMove = toDoItems[fromIndexPath.row]
        toDoItems[fromIndexPath.row] = toDoItems[to.row]
        toDoItems[to.row] = rowToMove
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
