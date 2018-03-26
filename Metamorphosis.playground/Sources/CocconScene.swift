import Foundation
import SpriteKit

public class CocconScene: SKScene {
    
    var happinessBar: HappinessBar!
    var bubbleController: BubbleController!
    var caterpillar: Caterpillar!
    var three: SKSpriteNode!
    var button: SKButton!
    
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.happinessBar = self.childNode(withName: "happinessBar") as! HappinessBar
        self.happinessBar.delegate = self
        
        self.three = self.childNode(withName: "three") as! SKSpriteNode
        self.button = self.childNode(withName: "button") as! SKButton
        
        self.bubbleController = BubbleController(scene: self)
        self.bubbleController.bubbleDelegate = self
        
        self.seeKindness()
    }
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        
    }
    
    public override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    open func seeKindness() {
        self.bubbleController.startCreateBalls()
    }
}

extension CocconScene : BubbleDelegate {
    
    public func popBubble(bubble: Bubble) {
        if bubble.parent != nil {
            bubble.removeFromParent()
            self.happinessBar.increaseBar(percentage: 0.1)
        }
    }
}

extension CocconScene : HappinessDelegate {
    
    func happinessIsFull() {
        print("nextPage")
    }
    
    func happinessIsEmpty() {
        
    }
}
