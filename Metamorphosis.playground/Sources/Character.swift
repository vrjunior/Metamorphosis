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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let caterpillarAtlas = SKTextureAtlas(named: "caterpillar")
        
        let numImages = caterpillarAtlas.textureNames.count
        
        for i in 1...numImages {
            let caterpillarTextureName = "caterpillar\(i)"
            walkFrames.append(caterpillarAtlas.textureNamed(caterpillarTextureName))
        }
    }
    
    func playWalkAnimation() {
        let walk = SKAction.repeatForever(SKAction.animate(with: walkFrames, timePerFrame: 0.1, resize: false, restore: true))
        
        self.run(walk, withKey: "walk")
    }
    
    func stopWalkAnimation() {
        self.removeAction(forKey: "walk")
    }
    
}
