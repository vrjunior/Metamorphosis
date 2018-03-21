import Foundation
import SpriteKit

public class GameScene: SKScene {
    
    public var happinessBar: HappinessBar!
    var bubbleController: BubbleController!
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.happinessBar = self.childNode(withName: "happinessBar") as! HappinessBar
        self.bubbleController = BubbleController(scene: self)
    
        bubbleController.startCreateBalls()
    }
    
//    public func touchDown(atPoint pos : CGPoint) {
//
//    }
//
//    public func touchMoved(toPoint pos : CGPoint) {
//
//    }
//
//    public func touchUp(atPoint pos : CGPoint) {
//
//    }
//
//    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
    
    public override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
