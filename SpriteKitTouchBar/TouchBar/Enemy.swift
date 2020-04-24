//
//  Enemy.swift
//  SpriteKitTouchBar
//
//  Created by Henrique Figueiredo Conte on 23/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import SpriteKit


class Enemy: SKLabelNode {
    
    init(text: String) {
        super.init()
        self.text = text
        self.fontSize = 13
        self.zRotation = 5.5
        self.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
