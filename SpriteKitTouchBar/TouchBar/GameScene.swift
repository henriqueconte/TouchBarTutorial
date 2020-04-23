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

//            case KeyIdentifiers.space.rawValue:
//
//                if self.playerLightNodes.isEmpty == false {
//
//                    if self.playerLightNodes.count == 1 {
//
//                        self.playerLightNodes.first?.removeFromParent()
//                        self.playerLightNodes.first?.falloff = 1.0
//                        self.addChild(self.playerLightNodes.first ?? SKNode())
//
//                        self.macScene?.backgroundNode?.color = NSColor(red: 255/255, green: 1/255, blue: 100/255, alpha: 0.8)
//                    }
//                    else {
//                        self.playerLightNodes.last?.removeFromParent()
//                        self.playerLightNodes.removeLast()
//                        self.removedLightNodes += 1
//                    }
//
//                }
            default:
                return event
            }
            return event
        }
    }
}
