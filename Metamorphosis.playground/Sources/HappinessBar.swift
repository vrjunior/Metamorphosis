import Foundation
import SpriteKit

public class HappinessBar : SKNode {
    
    private var _happinessLevel : Float = 0
    var happinessLevel : Float{
        set {
            if newValue >= 0 && newValue <= 100 {
                self._happinessLevel = newValue
            }
        }
        get {
            return _happinessLevel
        }
    }
    var backgroundBar: SKSpriteNode!
    var bar: SKSpriteNode!
    var happyFace: SKSpriteNode!
    var sadFace: SKSpriteNode!
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundBar = self.childNode(withName: "backgroundBar") as! SKSpriteNode
        self.bar = self.childNode(withName: "bar") as! SKSpriteNode
        self.happyFace = self.childNode(withName: "happyFace") as! SKSpriteNode
        self.sadFace = self.childNode(withName: "sadFace") as! SKSpriteNode
    }
    
    public func increaseBar(percentage: Float) {
        self.happinessLevel += percentage
        
        let newWidth = CGFloat(happinessLevel / 100) * backgroundBar.size.width
        let action = SKAction.resize(toWidth: newWidth, duration: 0.1)
        
        self.bar.run(action)
    }
    
}
