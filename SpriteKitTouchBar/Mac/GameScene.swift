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
    
    var playerNode: SKLabelNode?
    var backgroundNode: SKSpriteNode?
    
    var viewWidth: CGFloat {
        return view?.bounds.width ?? 0
    }
    
    var viewHeight: CGFloat {
        return view?.bounds.height ?? 0
    }
    
    public override func didMove(to view: SKView) {
        setBackground()
        setPlayer()
    }
    
    func setBackground() {
        backgroundNode = SKSpriteNode(texture: SKTexture(imageNamed: "spaceBackground"), size: CGSize(width: self.view?.bounds.width ?? 0, height: self.view?.bounds.height ?? 0))
        backgroundNode?.zPosition = 0
        backgroundNode?.anchorPoint = CGPoint(x: 0, y: 0)
        
        addChild(backgroundNode!)
    }
    
    func setPlayer() {
        playerNode = SKLabelNode(text: "🚀")
        playerNode?.position = CGPoint(x: viewWidth * 0.05, y: viewHeight / 3)
        playerNode?.zRotation = 5.5
        playerNode?.fontSize = 17
        
        addChild(playerNode!)
    }
}
