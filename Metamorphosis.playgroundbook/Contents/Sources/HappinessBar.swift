import Foundation
import SpriteKit

public protocol HappinessDelegate {
    func happinessIsFull()
    func happinessIsEmpty()
}

public class HappinessBar : SKNode {
    
    private var _happinessLevel : Float = 0 {
        didSet {
            let newWidth = CGFloat(happinessLevel) * self.backgroundBar.size.width
            let action = SKAction.run {
                self.bar.size.width = newWidth
            }
            
            self.bar.run(action)
        }
    }
    public var happinessLevel : Float {
        set {
            if newValue < 0 {
                self._happinessLevel = 0
                self.delegate?.happinessIsEmpty()
                return
            }
            if newValue > 1 {
                self._happinessLevel = 1
                self.delegate?.happinessIsFull()
                return
            }
            
            self._happinessLevel = newValue
        }
        get {
            return _happinessLevel
        }
    }
    var backgroundBar: SKSpriteNode!
    var bar: SKSpriteNode!
    var happyFace: SKSpriteNode!
    var sadFace: SKSpriteNode!
    
    public var delegate: HappinessDelegate?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundBar = self.childNode(withName: "backgroundBar") as! SKSpriteNode
        self.bar = self.childNode(withName: "bar") as! SKSpriteNode
        self.happyFace = self.childNode(withName: "happyFace") as! SKSpriteNode
        self.sadFace = self.childNode(withName: "sadFace") as! SKSpriteNode
        
        self.changeBar(percentage: happinessLevel)
    }
    
    
    
    private func changeBar(percentage: Float) {
        self.happinessLevel += percentage
    }
    
    public func decreaseBar(percentage: Float) {
        self.changeBar(percentage: -percentage)
    }
    
    public func increaseBar(percentage: Float) {
        self.changeBar(percentage: percentage)
    }
        
}
