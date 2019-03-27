//
//  ViewController.swift
//  Todoey
//
//  Created by Simuel Henderson on 3/19/19.
//  Copyright © 2019 Simuel Henderson. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var arrayItem = [Item]()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
//            arrayItem = items
//        }
        let newItem1 = Item(title: "Find Mike", done: false)
        arrayItem.append(newItem1)
        
        let newItem2 = Item(title: "Eat food", done: false)
        arrayItem.append(newItem2)
        
        let newItem3 = Item(title: "Find keys", done: false)
        arrayItem.append(newItem3)
        
        if let item = defaults.array(forKey: "TodoListArray") as? [Item]{
            arrayItem = item
        }
        
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item =  arrayItem[indexPath.row]
        
//        cell.textLabel?.text = arrayItem[indexPath.row].title
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK - TableView Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(arrayItem[indexPath.row])
        
        arrayItem[indexPath.row].done = !arrayItem[indexPath.row].done
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Item", message: "Add a new item", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let textItem = textField.text {
                self.arrayItem.append(Item(title: textItem, done: false))
                self.defaults.set(self.arrayItem, forKey: "TodoListArray")
            }
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

