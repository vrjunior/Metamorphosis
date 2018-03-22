//
//  Character.swift
//  Metamorphosis-XCODE
//
//  Created by Valmir Junior on 21/03/18.
//  Copyright © 2018 Valmir Junior. All rights reserved.
//

import Foundation
import SpriteKit

class Caterpillar : SKSpriteNode {
    
    var walkFrames: [SKTexture] = []
    public var moveDistance: CGFloat = 50
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let caterpillarAtlas = SKTextureAtlas(named: "caterpillar")
        
        let numImages = caterpillarAtlas.textureNames.count
        
        for i in 1...numImages {
            let caterpillarTextureName = "caterpillar\(i)"
            walkFrames.append(caterpillarAtlas.textureNamed(caterpillarTextureName))
        }
    }
    
    
    private func move(distance: CGFloat) {
        let animationTime = 0.1
        let moveTime = 1.0
        
        let walkAnimation = SKAction.repeatForever(SKAction.animate(with: walkFrames, timePerFrame: animationTime, resize: false, restore: true))
        
        let moveAction = SKAction.moveBy(x: distance, y: 0, duration: moveTime)
        
        let stopWalk = SKAction.run {
            self.removeAllActions()
        }
        
        let moveSequence = SKAction.sequence([moveAction, stopWalk])
        
        let group = SKAction.group([walkAnimation, moveSequence])

        self.run(group)
    }
    
    func moveLeft(){
        self.move(distance: -self.moveDistance)
    }
    
    
    
}
