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
    }
    
    func moveUp() {
        if self.position.y < 24 {
            setNewPosition(newPoint: CGPoint(x: self.position.x, y: self.position.y + 2), duration: 0.1)
        }
    }
    
    func moveDown() {
        if self.position.y > -3 {
            setNewPosition(newPoint: CGPoint(x: self.position.x, y: self.position.y - 2), duration: 0.1)
        }
    }
    
    private func setNewPosition(newPoint: CGPoint, duration: TimeInterval) {
        let moveAction = SKAction.move(to: newPoint, duration: duration)
        self.run(moveAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
