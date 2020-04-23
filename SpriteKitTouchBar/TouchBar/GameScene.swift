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
    
    var playerNode: Player?
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
        setKeyboardEvents()
    }
    
    func setBackground() {
        backgroundNode = SKSpriteNode(texture: SKTexture(imageNamed: "spaceBackground"), size: CGSize(width: self.view?.bounds.width ?? 0, height: self.view?.bounds.height ?? 0))
        backgroundNode?.zPosition = 0
        backgroundNode?.anchorPoint = CGPoint(x: 0, y: 0)
        
        addChild(backgroundNode!)
    }
    
    func setPlayer() {
        playerNode = Player(text: "🚀")
        playerNode?.position = CGPoint(x: viewWidth * 0.05, y: viewHeight / 3)
        
        addChild(playerNode!)
    }
    
    func setKeyboardEvents() {

        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { (event) -> NSEvent? in

            switch event.keyCode {
            case KeyIdentifiers.upArrow.rawValue:
                self.playerNode?.moveUp()
                
            case KeyIdentifiers.downArrow.rawValue:
                self.playerNode?.moveDown()

            case KeyIdentifiers.space.rawValue:
                let projectile = self.playerNode?.shoot()
                self.addChild(projectile!)
                
                let moveAction = SKAction.move(to: CGPoint(x: 700, y: projectile?.position.y ?? 0), duration: 1)
        
                projectile?.run(moveAction) {
                    projectile?.removeFromParent()
                }
                
            default:
                return event
            }
            return event
        }
    }
    
}
