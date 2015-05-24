//
//  MenuBarController.swift
//  Ctrl-C
//
//  Created by Hao on 5/24/15.
//  Copyright (c) 2015 Ctrl-C, Inc. All rights reserved.
//

import Cocoa
import ReactiveCocoa

class PopoverController: NSViewController {
    var popover = NSPopover()

    class func make() -> PopoverController {
        let c = PopoverController(nibName: nil, bundle: nil)!
        c.popover.contentViewController = c
        c.popover.behavior = NSPopoverBehavior.Transient
        return c
    }

    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
    }
}

class MenuBarController: NSObject {
    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(32)
    var popoverController = PopoverController.make()

    override init() {
        super.init()

        statusItem.button!.title = NSLocalizedString("^C", comment: "");
        statusItem.button!.rac_command = RACCommand(signalBlock: {
            [unowned self] (x) -> RACSignal! in
            let view = x as! NSView
            self.popoverController.popover.showRelativeToRect(NSZeroRect, ofView: view, preferredEdge: NSMinYEdge)
            return RACSignal.empty()
        })
    }
}
