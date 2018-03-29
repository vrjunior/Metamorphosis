import Foundation
import SpriteKit

public class CocoonScene: SKScene {
    
    var happinessBar: HappinessBar!
    var bubbleController: BubbleController!
    var three: SKSpriteNode!
    var button: SKButton!
    var audioHelper: AudioHelper!
    var bubbleAudio: AudioHelper!
    var transitionMessage: SKLabelNode!
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.happinessBar = self.childNode(withName: "happinessBar") as! HappinessBar
        self.happinessBar.delegate = self
        
        self.transitionMessage = self.childNode(withName: "transitionMessage") as! SKLabelNode
        
        self.three = self.childNode(withName: "three") as! SKSpriteNode
        self.button = self.childNode(withName: "button") as! SKButton
        
        self.bubbleController = BubbleController(scene: self)
        self.bubbleController.bubbleDelegate = self
        
        self.audioHelper = AudioHelper(audio: .second)
        self.audioHelper.play()
        
        self.bubbleAudio = AudioHelper(audio: .popBubble)
        
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

extension CocoonScene : BubbleDelegate {
    
    public func popBubble(bubble: Bubble) {
        if bubble.parent != nil {
            self.bubbleAudio.playOnce()
            bubble.removeFromParent()
            self.happinessBar.increaseBar(percentage: 0.1)
        }
    }
}

extension CocoonScene : HappinessDelegate {
    
    public func happinessIsFull() {
        self.transitionMessage.isHidden = false
        self.bubbleController.stopCreateBalls()
    }
    
    public func happinessIsEmpty() {
        
    }
}
