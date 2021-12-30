//
//  ViewController.swift
//  Bucket List crUD
//
//  Created by admin on 29/12/2021.
//

import UIKit

class BucketViewController: UITableViewController , BarButtonsDelegate {
var lists = ["live in forest for a week", "travel around the world","buy a tesla car"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("fine")
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = lists[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItem", sender: indexPath)

    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        lists.remove(at: indexPath.row)
        tableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem" {
        let navController = segue.destination as! UINavigationController
        let addItem = navController.topViewController as! AddToTableViewController
            addItem.delegate = self
            
        }
       else if segue.identifier == "editItem" {
            let navController = segue.destination as! UINavigationController
            let addItem = navController.topViewController as! AddToTableViewController
                addItem.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = lists[indexPath.row]
            addItem.item = item
           addItem.indexPath = indexPath
    }
    }
    
    func cancelButtonPressed(by controller: AddToTableViewController) {
        print("pressed")
        dismiss(animated: true, completion: nil)
    }
    func saveButtonPressed(by controller: AddToTableViewController , with text: String , at indexPath: NSIndexPath?){
        if let ip = indexPath {
            lists[ip.row] = text
        }
        else {
            lists.append(text)
        }
        tableView.reloadData()
        print("saved \(text)")
        dismiss(animated: true, completion: nil)

    }

}


