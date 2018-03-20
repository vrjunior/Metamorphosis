import Foundation
import SpriteKit
import UIKit

public class BubbleController {
    
    var scene: SKScene!
    
    let quotes: [String] = [
        "Kindness Matters",
        "Try Kindness",
        "Be kind",
        "Kindness inpires kindess"
    ]
    
    let colors = [
        #colorLiteral(red: 0.4, green: 0.8039215686, blue: 0.9294117647, alpha: 1), #colorLiteral(red: 0.1568627451, green: 0.6745098039, blue: 0.8823529412, alpha: 1), #colorLiteral(red: 0.9725490196, green: 0.5647058824, blue: 0.02745098039, alpha: 1), #colorLiteral(red: 0.9294117647, green: 0.2392156863, blue: 0.2862745098, alpha: 1)
    ]
    
    let maxBubblesPerWave: Int = 5
    
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func createBall() -> Bubble {
        
        //generates a random size between 50 ~ 100
        let randomSize = CGFloat(arc4random_uniform(100) + 51)
        //generate a random color
        let colorIndex: Int = Int(arc4random_uniform(UInt32(colors.count)))
        let color = colors[colorIndex]
        let bubble = Bubble(circleOfRadius: randomSize)
        
        bubble.physicsBody = SKPhysicsBody(circleOfRadius: randomSize)
        
        bubble.fillColor = color
        
        
        return bubble
        
    }
    
    public func startCreateBalls() {
        
        
    }
    
    private func createBallsWave() {
        
        let amountOfBalls = Int(arc4random_uniform(UInt32(maxBubblesPerWave)))
        
        for _ in 0..<amountOfBalls {
            
            let bubble = self.createBall()
            bubble.delegate = self
            
            //random width with bubble width
            let randomX = CGFloat(arc4random_uniform(UInt32(scene.size.width - bubble.frame.size.width))) + bubble.frame.size.width / 2
            
            
            bubble.position = CGPoint(x: randomX, y: 0)
            
            self.scene.addChild(bubble)
                        
        }
        
        
    }
    
}

extension BubbleController : BubbleDelegate {
    
    public func popBubble(bubble: Bubble) {
        if bubble.parent != nil {
            bubble.removeFromParent()
        }
    }
}
