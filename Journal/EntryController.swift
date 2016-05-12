//
//  EntryController.swift
//  Journal
//
//  Created by Patrick Pahl on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let kEntries = "entries"
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry] = []
    
    init(){
        loadFromPersistentStorage()
    }
    
    func createEntry(entry: Entry) {
        entries.append(entry)
        saveToPersistentStorage()
        
    }
    
    func removeEntry(entry: Entry){
        guard let index = entries.indexOf(entry) else {return}
        entries.removeAtIndex(index)
        saveToPersistentStorage()
    }

    func saveToPersistentStorage(){
        NSUserDefaults.standardUserDefaults().setObject(entries.map{$0.dictionaryCopy}, forKey: kEntries)
        
    }
    
    func loadFromPersistentStorage(){
        guard let entriesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kEntries) as? [[String: AnyObject]] else {return}
        self.entries = entriesDictionaryArray.flatMap{Entry(dictionary: $0)}
    }
    
    }



//save method

//func saveToPersistentStorage(){
//Convert [Playlist] -> String [[String: AnyObect]]
// NSUserDefaults.standardUserDefaults().setObject(playlists.map{$0.dictionaryCopy}, forKey: kPlaylists)
//}


//func loadFromPersistentStorage() {
//Converts [[String: AnyObject]] -> [Playlist]
//guard let playlistsDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kPlaylists) as? [[String: AnyObject]] else {return}
//self.playlists = playlistsDictionaryArray.flatMap{Playlist(dictionary: $0)}
//}
