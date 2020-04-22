//
//  TouchBarView.swift
//  SpriteKitTouchBar
//
//  Created by Henrique Figueiredo Conte on 22/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Cocoa
import Foundation


@available(OSX 10.12.2, *)
class TouchBarView: NSView {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
    private let kPaddleWidth    = 100.0
    private let kPaddleHeight   = 30.0
    
    var touchBarPaddle: NSView?
   // weak var delegate: TouchBarViewDelegate? = nil
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        if touchBarPaddle == nil {
            touchBarPaddle = NSView(frame: NSRect(x: Double(frame.width / 2) - kPaddleWidth / 2,
                                                  y: 0,
                                                  width: kPaddleWidth,
                                                  height: kPaddleHeight))
            touchBarPaddle?.wantsLayer = true   // Necessary
            touchBarPaddle?.layer?.cornerRadius = 15.0
            touchBarPaddle?.layer?.masksToBounds = true
            touchBarPaddle?.layer?.backgroundColor = NSColor.blue.cgColor
            
            addSubview(touchBarPaddle!)
        }
    }
}
