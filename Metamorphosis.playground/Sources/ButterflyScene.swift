//
//  ButterflyScene.swift
//  Metamorphosis_Sources
//
//  Created by Valmir Junior on 26/03/18.
//  Copyright © 2018 Valmir Junior. All rights reserved.
//

import Foundation
import SpriteKit

public class ButterflyScene: SKScene {
    
    var butterfly: Butterfly!
    
    var background: SKNode!
    
    var sky: SKSpriteNode!
    var mountain: SKSpriteNode!
    var cloud: SKSpriteNode!
    var trees: SKSpriteNode!
    var floor: SKSpriteNode!
    
    var firstTree: SKSpriteNode!
    
    
    private var lastUpdate: TimeInterval = 0
    
    public override func sceneDidLoad() {
        
        self.background = self.childNode(withName: "background")
        
        self.sky = self.background.childNode(withName: "sky") as! SKSpriteNode
        self.mountain = self.background.childNode(withName: "mountain") as! SKSpriteNode
        self.cloud = self.background.childNode(withName: "cloud") as! SKSpriteNode
        self.trees = self.background.childNode(withName: "trees") as! SKSpriteNode
        self.firstTree = self.trees.childNode(withName: "tree") as! SKSpriteNode
        self.floor = self.background.childNode(withName: "floor") as! SKSpriteNode
        
        
    }
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
    

    }
    
    public override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        if self.lastUpdate == 0 {
            self.lastUpdate = currentTime
        }
        
        let deltaTime = currentTime - self.lastUpdate
        self.lastUpdate = currentTime
        
        self.moveBackgrounds(deltaTime: deltaTime)
    }
    
    
    //Do parallax effect
    private func moveBackgrounds(deltaTime: TimeInterval) {
        if !self.isPaused {
            
            //move sky
            self.moveBackground(node: self.sky, deltaTime: deltaTime, factor: 10)
            
            //move mountain
            self.moveBackground(node: self.mountain, deltaTime: deltaTime, factor: 20)
            
            //move cloud
            self.moveBackground(node: self.cloud, deltaTime: deltaTime, factor: 30)
            
            //move trees
            self.moveBackground(node: self.trees, deltaTime: deltaTime, factor: 40)
            
            //move floor
            self.moveBackground(node: self.floor, deltaTime: deltaTime, factor: 100)
            
        }
    }
    
    
    private func moveBackground(node:SKSpriteNode, deltaTime: TimeInterval, factor: Double) {
        
        node.position.x -= CGFloat(deltaTime * factor)

    }
    
}

