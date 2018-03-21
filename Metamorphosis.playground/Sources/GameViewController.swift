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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                let caterpillar = scene.childNode(withName: "caterpillar") as! Caterpillar
                caterpillar.playWalkAnimation()
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            
        }
    }
}
