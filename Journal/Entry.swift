//
//  Entry.swift
//  Journal
//
//  Created by Patrick Pahl on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry : Equatable {
    let title : String
    let text : String
    let timestamp : NSDate
    
    init(title: String, text: String, timestamp: NSDate = NSDate()){
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
}

func ==(lhs: Entry , rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.text == rhs.text && lhs.timestamp == rhs.timestamp
}

