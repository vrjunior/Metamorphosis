import Foundation
import SpriteKit


public protocol BubbleDelegate {
    func popBubble(bubble: Bubble)
}

open class Bubble : SKShapeNode {
    
    public var delegate : BubbleDelegate?
    
    init(circleOfRadius: CGFloat){
        super.init()
        
        let diameter = circleOfRadius * 2
        self.path = SKShapeNode(ellipseIn: CGRect(origin: CGPoint.zero, size: CGSize(width: diameter, height: diameter))).path
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
