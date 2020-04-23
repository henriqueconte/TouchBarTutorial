//
//  Player.swift
//  SpriteKitTouchBar
//
//  Created by Henrique Figueiredo Conte on 23/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import SpriteKit


class Player: SKLabelNode {
    
    init(text: String) {
        super.init()
        self.text = text
        self.fontSize = 17
        self.zRotation = 5.5
        self.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    }
    
    func moveUp() {
        if self.position.y < 26 {
            setNewPosition(newPoint: CGPoint(x: self.position.x, y: self.position.y + 5), duration: 0.1)
        }
    }
    
    func moveDown() {
        if self.position.y > 2 {
            setNewPosition(newPoint: CGPoint(x: self.position.x, y: self.position.y - 5), duration: 0.1)
        }
    }
    
    func shoot() -> SKLabelNode {
        let shootNode = SKLabelNode(text: "💣")
        shootNode.fontSize = 8
        shootNode.position = CGPoint(x: self.position.x + 5, y: self.position.y)
        shootNode.zRotation = -5.5
        
        let spinningAction = SKAction.repeatForever(SKAction.rotate(byAngle: .pi * 2, duration: 0.5))
        
        shootNode.run(spinningAction)
        
        return shootNode
    }
    
    private func setNewPosition(newPoint: CGPoint, duration: TimeInterval) {
        let moveAction = SKAction.move(to: newPoint, duration: duration)
        self.run(moveAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
