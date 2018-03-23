import Foundation
import SpriteKit

public class GameScene: SKScene {
    
    public var happinessBar: HappinessBar!
    var bubbleController: BubbleController!
    var caterpillar: Caterpillar!
    var three: SKSpriteNode!
    var button: SKButton!
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let audio = AudioHelper.shared
        
        self.happinessBar = self.childNode(withName: "happinessBar") as! HappinessBar
        self.caterpillar = self.childNode(withName: "caterpillar") as! Caterpillar
        self.three = self.childNode(withName: "three") as! SKSpriteNode
        self.button = self.childNode(withName: "button") as! SKButton
        
        self.button.delegate = self
        
        
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
    
    private func caterpillarTurnOnCacoon() {
        
    }
}


extension GameScene : SKButtonDelegate {
    
    func buttonPressed(target: SKButton) {
        self.caterpillar.moveLeft()
    }
}

extension GameScene : SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        
        self.caterpillarTurnOnCacoon()
        
    }
    
}
