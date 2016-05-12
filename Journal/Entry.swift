//
//  Entry.swift
//  Journal
//
//  Created by Patrick Pahl on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry : Equatable {
    var title : String
    var text : String
    var timestamp : NSDate
    
    private let kTitle = "title"
    private let kText = "text"
    private let kTimestamp = "timestamp"

    var dictionaryCopy: [String: AnyObject] {
        return [kTitle: self.title, kText: self.text, kTimestamp: NSDate()]
    }
    
    init(title: String, text: String, timestamp: NSDate = NSDate()){
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
    
        init?(dictionary: [String: AnyObject]){
            guard let title = dictionary[kTitle] as? String,
                let text = dictionary[kText] as? String,
                let timestamp = dictionary[kTimestamp] as? NSDate else {return nil}
            self.title = title
            self.text = text
            self.timestamp = timestamp
    }
}

func ==(lhs: Entry , rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.text == rhs.text && lhs.timestamp == rhs.timestamp
}


