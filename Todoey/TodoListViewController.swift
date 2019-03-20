//
//  ViewController.swift
//  Todoey
//
//  Created by Simuel Henderson on 3/19/19.
//  Copyright © 2019 Simuel Henderson. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let arrayItem = ["Find Mike", "Buy Eggos", "Destroy Demon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = arrayItem[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(arrayItem[indexPath.row])
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark{
            cell?.accessoryType = .none
        }
        else {
            cell?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


}
