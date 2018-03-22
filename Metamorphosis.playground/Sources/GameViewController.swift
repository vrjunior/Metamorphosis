//
//  GameViewController.swift
//  Metamorphosis-XCODE
//
//  Created by Valmir Junior on 19/03/18.
//  Copyright © 2018 Valmir Junior. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var caterpillar: Caterpillar!
    var three: SKSpriteNode!
    var button: SKButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                self.caterpillar = scene.childNode(withName: "caterpillar") as! Caterpillar
                self.three = scene.childNode(withName: "three") as! SKSpriteNode
                self.button = scene.childNode(withName: "button") as! SKButton
            
                self.button.delegate = self
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            
        }
    }
    
}

extension GameViewController : SKButtonDelegate {
    
    func buttonPressed(target: SKButton) {
        self.caterpillar.moveLeft()
    }
}
