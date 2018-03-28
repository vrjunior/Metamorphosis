//
//  Butterfly.swift
//  Metamorphosis_Sources
//
//  Created by Valmir Junior on 26/03/18.
//  Copyright © 2018 Valmir Junior. All rights reserved.
//

import Foundation
import SpriteKit

class Butterfly : SKSpriteNode {
    
    var flyFrames: [SKTexture] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for index in 0...15 {
            
            let texture = SKTexture(imageNamed: "butterfly\(index)")
            
            self.flyFrames.append(texture)
            
        }
        
        self.startFlyAnimation()
    }
    
    private func startFlyAnimation() {
        let action = SKAction.animate(with: self.flyFrames, timePerFrame: 0.03, resize: false, restore: true)
        let repeatAction = SKAction.repeatForever(action)
        
        self.run(repeatAction)
    }
    
    
    
}
