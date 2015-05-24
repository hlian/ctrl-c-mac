//
//  AppDelegate.swift
//  mac
//
//  Created by Hao on 5/24/15.
//  Copyright (c) 2015 Ctrl-C, Inc. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    var menuBarController: MenuBarController!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.menuBarController = MenuBarController()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

}

