import Foundation
import SpriteKit

public class GameScene: SKScene {
    
    var happinessBar: HappinessBar!
    var bubbleController: BubbleController!
    var caterpillar: Caterpillar!
    var three: SKSpriteNode!
    var button: SKButton!
    
    
    public override func sceneDidLoad() {
        
        super.sceneDidLoad()
        
        self.happinessBar = self.childNode(withName: "happinessBar") as! HappinessBar
        self.happinessBar.happinessLevel = 1
        
        self.caterpillar = self.childNode(withName: "caterpillar") as! Caterpillar
        self.three = self.childNode(withName: "three") as! SKSpriteNode
        self.button = self.childNode(withName: "button") as! SKButton
        
        self.button.delegate = self
    }
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        
    }

    
    public override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    private func caterpillarTurnOnCacoon() {
        //let nextScene = CocconScene(fileNamed: "CocconScene")
    }
}


extension GameScene : SKButtonDelegate {
    
    func buttonPressed(target: SKButton) {
        self.caterpillar.moveLeft()
        self.happinessBar.decreaseBar(percentage: 0.3)
    }
}

extension GameScene : SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        
        self.caterpillarTurnOnCacoon()
        
    }
    
}
