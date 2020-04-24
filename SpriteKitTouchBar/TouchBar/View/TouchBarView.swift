//
//  TouchBarView.swift
//  SpriteKitTouchBar
//
//  Created by Henrique Figueiredo Conte on 22/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Cocoa
import Foundation
import SpriteKit


@available(OSX 10.12.2, *)
class TouchBarView: NSViewController {

    private lazy var gameView: SKView = {
        let v = SKView(frame: self.view.bounds)
        v.autoresizingMask = [.width, .height]
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = NSView()
        view.addSubview(gameView)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        if gameView.scene == nil {
            showStartScene()
        }
    }
    
    func showStartScene() {
        let scene = SKScene(fileNamed: "StartScene") as? StartScene
        scene!.scaleMode = .aspectFill
        gameView.presentScene(scene)
    }
    
}
