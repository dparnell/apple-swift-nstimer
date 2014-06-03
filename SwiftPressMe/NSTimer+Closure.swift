//
//  NSTimer+Closure.swift
//  SwiftPressMe
//
//  Created by Daniel Parnell on 3/06/2014.
//  Copyright (c) 2014 Daniel Parnell. Some Rights Reserved.
//  This work is licensed under a Creative Commons Attribution 3.0 Unported License.
//  http://creativecommons.org/licenses/by/3.0/
//

import Foundation

extension NSTimer {
    class NSTimerCallbackHolder : NSObject {
        var callback: () -> ()
        
        init(callback: () -> ()) {
            self.callback = callback
        }
        
        func tick(timer: NSTimer) {
            callback()
        }
    }
    
    class func scheduledTimerWithTimeInterval(ti: NSTimeInterval, repeats yesOrNo: Bool, closure: () -> ()) -> NSTimer! {
        var holder = NSTimerCallbackHolder(closure)
        holder.callback = closure
        
        return NSTimer.scheduledTimerWithTimeInterval(ti, target: holder, selector: Selector("tick:"), userInfo: nil, repeats: yesOrNo)
    }
}