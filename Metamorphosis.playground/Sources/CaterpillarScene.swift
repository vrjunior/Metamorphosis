import Foundation
import SpriteKit

public class CaterpillarScene: SKScene {
    
    var happinessBar: HappinessBar!
    var bubbleController: BubbleController!
    var caterpillar: Caterpillar!
    var three: SKSpriteNode!
    var button: SKButton!
    
    var particle : SKEmitterNode!
    var transitionMessage : SKLabelNode!
    
    var audioHelper: AudioHelper!
    
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        
        self.setupNodes()
        self.physicsWorld.contactDelegate = self
        self.button.delegate = self
        
        self.audioHelper = AudioHelper(audio: .first)
        self.audioHelper.play()
    }
    
    private func setupNodes() {
        self.particle = self.childNode(withName: "particle") as! SKEmitterNode
        self.transitionMessage = self.childNode(withName: "transitionMessage") as! SKLabelNode
        self.particle.isHidden = true
        self.happinessBar = self.childNode(withName: "happinessBar") as! HappinessBar
        self.happinessBar.happinessLevel = 1
        
        self.caterpillar = self.childNode(withName: "caterpillar") as! Caterpillar
        self.three = self.childNode(withName: "three") as! SKSpriteNode
        self.button = self.childNode(withName: "button") as! SKButton
    }
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        
    }

    
    public override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    public func caterpillarTurnOnCacoon() {
        self.particle.isHidden = false
        self.removeCaterpillar()
        self.transitionMessage.isHidden = false
    }
    
    private func removeCaterpillar() {
        self.caterpillar.removeAllActions()
        let fadeAlpha = SKAction.fadeAlpha(to: 0, duration: 0.2)
        let remove = SKAction.run {
            self.caterpillar.isHidden = true
        }
        
        let sequence = SKAction.sequence([fadeAlpha, remove])
        
        self.caterpillar.run(sequence)
    }
    
}


extension CaterpillarScene : SKButtonDelegate {
    
    public func buttonPressed(target: SKButton) {
        self.caterpillar.moveLeft()
        self.happinessBar.decreaseBar(percentage: 0.1)
    }
}

extension CaterpillarScene : SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        
        self.caterpillarTurnOnCacoon()
        
    }
    
}
