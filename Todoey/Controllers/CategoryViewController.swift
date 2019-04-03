//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Simuel Henderson on 4/2/19.
//  Copyright © 2019 Simuel Henderson. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var categoryArray = [Category]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let item = categoryArray[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    func saveItems(){
        do {
            try context.save()
        }
        catch {
            print("Error: saving context: \(error)")
        }
        
    }
    
    func loadItems(){
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categoryArray = try context.fetch(request)
        }
        catch{
            print("Error loading data: \(error)")
        }
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "", message: "Add New Category", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (alertAction) in
//            print(textField.text!)
            let cat = Category(context: self.context)
            cat.name = textField.text
            self.categoryArray.append(cat)
            self.saveItems()
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter in a new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let item = categoryArray[indexPath.row]
//        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems"{
            let controller = segue.destination as! TodoListViewController
//            if let indexPath = tableView.indexPathForSelectedRow{
//                controller.selectedCategory = categoryArray[indexPath.row]
//            }            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                controller.selectedCategory = categoryArray[indexPath.row]
            }
        }
    }
    
}
