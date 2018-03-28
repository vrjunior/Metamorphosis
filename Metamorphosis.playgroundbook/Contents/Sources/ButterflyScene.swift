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
    var heartCounter: Int = 0
    var heartCounterLabel: SKLabelNode!
    
    var background: SKNode!
    var skies: [SKSpriteNode] = []
    var mountains: [SKSpriteNode] = []
    var clouds: [SKSpriteNode] = []
    var trees: [SKSpriteNode] = []
    var floors: [SKSpriteNode] = []
    var firstTree: SKSpriteNode!
    var remover : SKSpriteNode!
    var heartController: HeartController!
    var spawners : [SKSpriteNode] = []
    
    var buttonUp: SKButton!
    var buttonDown: SKButton!
    var butterflyLevel : Int = 1
    
    
    private var lastUpdate: TimeInterval = 0
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.setupParallaxNodes()
        self.setupSpawners()
        
        self.physicsWorld.contactDelegate = self
        
        self.heartController = HeartController()
        self.heartController.delegate = self
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
    
    private func setupParallaxNodes() {
        
        self.butterfly = self.childNode(withName: "butterfly") as! Butterfly
        
        self.background = self.childNode(withName: "background")
        
        self.buttonDown = self.childNode(withName: "buttonDown") as! SKButton
        self.buttonDown.delegate = self
        
        self.buttonUp = self.childNode(withName: "buttonUp") as! SKButton
        self.buttonUp.delegate = self
        
        self.remover = self.childNode(withName: "remover") as! SKSpriteNode
        self.heartCounterLabel = self.childNode(withName: "heartCounter") as! SKLabelNode
    
        let sky1 = self.background.childNode(withName: "sky") as! SKSpriteNode
        let sky2 = self.background.childNode(withName: "sky2") as! SKSpriteNode
    
        self.skies = [sky1, sky2]
    
        let mountain1 = self.background.childNode(withName: "mountain") as! SKSpriteNode
        let mountain2 = self.background.childNode(withName: "mountain2") as! SKSpriteNode
    
        self.mountains = [mountain1, mountain2]
    
        let cloud1 = self.background.childNode(withName: "cloud") as! SKSpriteNode
        let cloud2 = self.background.childNode(withName: "cloud2") as! SKSpriteNode
    
        self.clouds = [cloud1, cloud2]
    
    
        let tree1 = self.background.childNode(withName: "trees") as! SKSpriteNode
        let tree2 = self.background.childNode(withName: "trees2") as! SKSpriteNode
    
        self.trees = [tree1, tree2]
    
    
        let floor1 = self.background.childNode(withName: "floor") as! SKSpriteNode
        let floor2 = self.background.childNode(withName: "floor2") as! SKSpriteNode
        
        self.firstTree = floor1.childNode(withName: "tree") as! SKSpriteNode
    
        self.floors = [floor1, floor2]
    }
    
    func setupSpawners() {
        
        for i in 0...3 {
            if let spawner = self.childNode(withName: "spawner\(i)") as? SKSpriteNode {
                self.spawners.append(spawner)
            }
        }
    }
    
    
    //Do parallax effect
    private func moveBackgrounds(deltaTime: TimeInterval) {
        if !self.isPaused {
            
            //move sky
            self.moveBackground(nodes: &self.skies, deltaTime: deltaTime, factor: 10)
            
            //move cloud
            self.moveBackground(nodes: &self.clouds, deltaTime: deltaTime, factor: 40)
            
            //move mountain
            self.moveBackground(nodes: &self.mountains, deltaTime: deltaTime, factor: 60)
            
            //move trees
            self.moveBackground(nodes: &self.trees, deltaTime: deltaTime, factor: 100)
            
            //move floor
            self.moveBackground(nodes: &self.floors, deltaTime: deltaTime, factor: 140)
            
            self.enumerateChildNodes(withName: "heart") { (heart, error) in
                let heartSprite = heart as! SKSpriteNode
                self.moveSprite(node: heartSprite, deltaTime: deltaTime, factor: 140)
            }

        }
    }
    
    
    private func moveBackground( nodes:inout [SKSpriteNode], deltaTime: TimeInterval, factor: Double) {
        
        for node in nodes {
            
            if (node.position.x + node.frame.width) < 0 {
                //removes the first node
                let currentNode = nodes.removeFirst()
                
                //get the next node
                let nextNode = nodes[0]
                
                //change position of the first node removed
                currentNode.position.x = nextNode.position.x + nextNode.frame.width
                
                //add the first removed node to the end of array
                nodes.append(currentNode)
            }
            
            node.position.x -= CGFloat(deltaTime * factor)
        }
    }
    
    private func moveSprite(node: SKSpriteNode, deltaTime: TimeInterval, factor: Double) {
        node.position.x -= CGFloat(deltaTime * factor)
    }
    
    public func handleHeartContact(heart: SKPhysicsBody, another: SKPhysicsBody) {
        
        //handle butterfly and heart contact
        if another.categoryBitMask == butterfly.physicsBody?.categoryBitMask {
            
            if heart.node?.parent != nil {
                let alphaAction = SKAction.fadeAlpha(to: 0, duration: 0.1)
                let removeAction = SKAction.run {
                    heart.node?.removeFromParent()
                }
                
                let sequence = SKAction.sequence([alphaAction, removeAction])
                
                heart.node?.run(sequence)
                
                //increment counter
                self.heartCounter += 1
                self.heartCounterLabel.text = "\(self.heartCounter)"
            }
            
            return
        }
        
        //handle remover and heart cont
        if another.categoryBitMask == self.remover.physicsBody?.categoryBitMask {
            if heart.node?.parent != nil {
                heart.node?.removeFromParent()
            }
        }
    }
    
    func updateButterfly() {
        
        let yAction = SKAction.moveTo(y: self.spawners[self.butterflyLevel].position.y, duration: 0.1)
        
        self.butterfly.run(yAction)
    }
    
}

extension ButterflyScene : SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == Heart.categoryBitMask {
            self.handleHeartContact(heart: contact.bodyA, another: contact.bodyB)
        }
        
        if contact.bodyB.categoryBitMask == Heart.categoryBitMask {
            self.handleHeartContact(heart: contact.bodyB, another: contact.bodyA)
        }
        
        if contact.bodyA.node?.name == "tree" || contact.bodyB.node?.name == "tree" {
            if self.firstTree.parent != nil {
                self.firstTree.removeFromParent()
            }
            return
        }
    }
    
}

extension ButterflyScene : HeartControllerDelegate {
    
    func spawn() {
        let heart = Heart()
        heart.zPosition = 10

        let randomIndex = Int(arc4random_uniform(UInt32(self.spawners.count)))
        
        let spawer = self.spawners[randomIndex]
        
        heart.position = spawer.position
        self.addChild(heart)
    
    }
    
}

extension ButterflyScene : SKButtonDelegate {
    
    func buttonPressed(target: SKButton) {
        
        if target == self.buttonUp {
            
            if self.butterflyLevel > 0 {
                
                self.butterflyLevel -= 1
            }
            
            self.updateButterfly()
            return
        }
        
        if target == self.buttonDown {
            
            if self.butterflyLevel < (self.spawners.count - 1) {
                
                self.butterflyLevel += 1
            }
            
            self.updateButterfly()
            return
        }
    
    }
    
    
}
