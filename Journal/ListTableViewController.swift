//
//  ListTableViewController.swift
//  Journal
//
//  Created by Patrick Pahl on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EntryController.sharedInstance.entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("journalCell", forIndexPath: indexPath)
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        return cell
    }
    
    ////////SWIPE TO DELETE
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let deletedEntry = EntryController.sharedInstance.entries[indexPath.row]
            EntryController.sharedInstance.removeEntry(deletedEntry)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    /*
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
     
     
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    */
    

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetail", let indexPath = tableView.indexPathForSelectedRow {
            let entryVC = segue.destinationViewController as! EntryViewController
            entryVC.entry = EntryController.sharedInstance.entries[indexPath.row]
            
            
            //TODO: Pass the entry that was selected from the tableView to the entryVC
            //songVC.playlist = playlist
        }
    }
}




