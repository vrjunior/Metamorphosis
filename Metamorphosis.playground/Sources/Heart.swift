//
//  Heart.swift
//  Metamorphosis_Sources
//
//  Created by Valmir Junior on 27/03/18.
//  Copyright © 2018 Valmir Junior. All rights reserved.
//

import Foundation
import SpriteKit


class Heart : SKSpriteNode {
    
    static let categoryBitMask: UInt32 = 4
    static let contactBitMask: UInt32 = 7
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = SKTexture(imageNamed: "heart")
        self.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        let physics = SKPhysicsBody(rectangleOf: self.size)
        physics.categoryBitMask = Heart.categoryBitMask
        physics.contactTestBitMask = Heart.contactBitMask
        physics.affectedByGravity = false
        
        self.physicsBody = physics
        self.name = "heart"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
