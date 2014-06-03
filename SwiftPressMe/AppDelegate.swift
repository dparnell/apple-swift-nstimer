//
//  AppDelegate.swift
//  SwiftPressMe
//
//  Created by Daniel Parnell on 3/06/2014.
//  Copyright (c) 2014 Daniel Parnell. All rights reserved.
//

import Cocoa

let messages = ["Oh Yes!", "More", "Harder!", "Press Me Again!", "Don't stop!"]

class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet var window: NSWindow
    
    var timer : NSTimer? = nil

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


    @IBAction func pressed(sender : NSButton) {
        var index : Int = (Int)(rand()) % messages.count
        sender.title = messages[index]
        
        if timer {
            timer!.invalidate()
        }

        timer = NSTimer.scheduledTimerWithTimeInterval(10.0, repeats: false) {
            sender.title = "Press Me"
        }
    }
}

