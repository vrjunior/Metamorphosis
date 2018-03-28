import Foundation
import SpriteKit


public protocol BubbleDelegate {
    func popBubble(bubble: Bubble)
}

open class Bubble : SKShapeNode {
    
    public var delegate : BubbleDelegate?
    public var label : SKLabelNode = SKLabelNode()
    
    init(circleOfRadius: CGFloat, text: String){
        super.init()
        
        self.setupLabel(text: text)
        
        var diameter = circleOfRadius * 2

        //check if text fits on the circle, if not the bubble is resized
        diameter = diameter > self.label.frame.width ? diameter : self.label.frame.width + 10
        
        self.path = SKShapeNode(ellipseIn: CGRect(origin: CGPoint.zero, size: CGSize(width: diameter, height: diameter))).path
        
        self.label.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        
        self.isUserInteractionEnabled = true
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: circleOfRadius)
        self.physicsBody?.affectedByGravity = false
        
        self.physicsBody?.collisionBitMask = 1
        self.physicsBody?.categoryBitMask = 1
        
        self.run(self.randomBubbleAction(screenHeight: 1000)) {
            self.removeFromParent()
        }
        
        
       // self.setupLabel(center: self.frame.width / 2)
        
    }
    
    private func setupLabel(text: String) {
        self.label.text = text
        self.label.fontSize = 24
        self.label.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        //self.label.lineBreakMode = .
        self.label.numberOfLines = 2
        
        //bold text
        if let fontName = self.label.fontName {
            self.label.fontName = "\(fontName)-Bold"
        }
        
        //adding label
        self.addChild(label)
        
    }
    
    private func randomBubbleAction(screenHeight: CGFloat) -> SKAction {
        
        var actions: [SKAction] = [SKAction]()
        var bubbleHeight: CGFloat = 0
        
        while(bubbleHeight < screenHeight) {
            
            //get a value between 1 and 10
            let randomRight = CGFloat(arc4random_uniform(UInt32(19)) + 10)
            
            //get a value between -10 and -1
            let randomLeft = -(CGFloat(arc4random_uniform(UInt32(19)) + 10))
            
            //get a valye between 1 and 10
            let upRandom1 = CGFloat(arc4random_uniform(UInt32(19)) + 10)
            
            //get a valye between 1 and 10
            let upRandom2 = CGFloat(arc4random_uniform(UInt32(19)) + 10)
            
            //ge a value between 0.1 and 0.3
            let randomTime = TimeInterval(arc4random_uniform(UInt32(5)) + 5) * 0.1
            
            let moveRight = SKAction.moveBy(x: randomRight, y: upRandom1, duration: randomTime)
            let moveLeft = SKAction.moveBy(x: randomLeft, y: upRandom2, duration: randomTime)
            
            let shouldRight = arc4random_uniform(1)
            
            if shouldRight == 1 {
                actions.append(moveRight)
                actions.append(moveLeft)
            }
            else {
                actions.append(moveLeft)
                actions.append(moveRight)
            }
            
            bubbleHeight += (upRandom1 + upRandom2)
        }
    
    
        return SKAction.sequence(actions)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.delegate?.popBubble(bubble: self)
    }
    
//    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
//    }
//    
//    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
//    }
    
}
