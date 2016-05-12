//
//  EntryViewController.swift
//  Journal
//
//  Created by Patrick Pahl on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var journalTitle: UITextField!
    
    @IBOutlet weak var journalTextField: UITextView!
    
    //TODO: Create an entry variable to use in the prepareForSegue
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let newEntry = self.entry {
            updateWith(newEntry)
        }
    }
    
    @IBAction func saveJournal(sender: AnyObject) {
        if let title = journalTitle.text, body = journalTextField.text where title.characters.count > 0 && body.characters.count > 0 {
            let newEntry = Entry(title: title, text: body)
            EntryController.sharedInstance.createEntry(newEntry)
            navigationController?.popViewControllerAnimated(true)
            
        }
    }
    
    func updateWith(entry: Entry) {
        self.journalTextField.text = entry.text
        self.journalTitle.text = entry.title
    }
    //TODO: Add an updateWith method to update the view according to what entry was selected
}
