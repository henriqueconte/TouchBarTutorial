//
//  TouchBarNewScene.swift
//  SpriteKitTouchBar
//
//  Created by Henrique Figueiredo Conte on 06/05/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import SpriteKit


class TouchBarNewScene: SKScene {
    
    var backgroundNode: SKSpriteNode?
    var playerNode: NewPlayer?
    let viewWidth: CGFloat = 690
    let viewHeight: CGFloat = 30
    let groundPosition: CGFloat = 18
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setBackground()
        setPlayer()
        setKeyboardEvents()
    }
    
    private func setBackground() {
        backgroundNode = SKSpriteNode(texture: SKTexture(imageNamed: "caveBackground"), size: CGSize(width: self.view?.bounds.width ?? 0, height: self.view?.bounds.height ?? 0))
        backgroundNode?.zPosition = 0
        backgroundNode?.anchorPoint = CGPoint(x: 0, y: 0)
        backgroundNode?.lightingBitMask = BitmaskConstants.affectedByLight
        
        addChild(backgroundNode!)
    }
    
    private func setPlayer() {
        playerNode = NewPlayer(texture: SKTexture(imageNamed: "charRight1"), color: NSColor.clear, size: CGSize(width: 11, height: 16))
        playerNode?.position = CGPoint(x: viewWidth * 0.05, y: groundPosition)
        
        addChild(playerNode!)
    }
    
    func setKeyboardEvents() {

        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { (event) -> NSEvent? in

            switch event.keyCode {
            case KeyIdentifiers.leftArrow.rawValue:
                self.playerNode?.moveLeft()
                
            case KeyIdentifiers.rightArrow.rawValue:
                self.playerNode?.moveRight()
                
            default:
                return event
            }
            return event
        }
    }
    
}
