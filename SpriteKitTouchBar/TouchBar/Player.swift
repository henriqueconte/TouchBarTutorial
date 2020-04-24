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
        self.name = "player"
        setDefaultPhysicsBody(from: self)
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
        shootNode.name = "playerBomb"
        setDefaultPhysicsBody(from: shootNode)
        
        let spinningAction = SKAction.repeatForever(SKAction.rotate(byAngle: .pi * 2, duration: 0.5))
        
        shootNode.run(spinningAction)
        
        return shootNode
    }
    
    func die() {
        self.removeAllActions()
        
        let explosion = SKEmitterNode(fileNamed: "Explosion")!
        addChild(explosion)
        explosion.resetSimulation()
        explosion.particleTexture = SKTexture(imageNamed: "Bloop")
        explosion.position = CGPoint(x: self.position.x, y: self.position.y)
        explosion.particleSize = CGSize(width: 10, height: 10)
        
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)

        self.run(fadeOut) {
            explosion.removeFromParent()
            self.removeFromParent()
        }
    }
    
    private func setDefaultPhysicsBody(from node: SKNode) {
        let physicsBody = SKPhysicsBody(rectangleOf: node.frame.size)
        physicsBody.affectedByGravity = false
        physicsBody.isDynamic = true
        physicsBody.contactTestBitMask = 1
        physicsBody.collisionBitMask = 0
        
        node.physicsBody = physicsBody
    }
    
    private func setNewPosition(newPoint: CGPoint, duration: TimeInterval) {
        let moveAction = SKAction.move(to: newPoint, duration: duration)
        self.run(moveAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
