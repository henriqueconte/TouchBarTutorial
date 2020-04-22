//
//  GameScene.swift
//  SpriteKitTouchBar
//
//  Created by Henrique Figueiredo Conte on 22/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import SpriteKit


public class GameScene: SKScene {
    func didMoveTo(_ locationX: Double) -> Bool {
        return true
    }
    
    
    public override func didMove(to view: SKView) {
        let node = SKSpriteNode()
        node.color = NSColor.red
        node.position = CGPoint(x: 10, y: 5)
        node.size = CGSize(width: 10, height: 10)
        
        self.addChild(node)
        
    }
}
