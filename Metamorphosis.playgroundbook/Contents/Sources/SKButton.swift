//
//  SKButton.swift
//  PepperJourney
//
//  Created by Valmir Junior on 13/12/17.
//  Copyright © 2017 Valmir Junior. All rights reserved.
//
import Foundation
import SpriteKit

@objc public protocol SKButtonDelegate {
    func buttonPressed(target: SKButton)
    @objc optional func buttonReleased(target: SKButton)
}

public class SKButton : SKSpriteNode {
    
    public var delegate : SKButtonDelegate?
    private var _numberOfTouches = 1
    public var numberOfTouches: Int {
        set {
            if newValue > 0 {
                self._numberOfTouches = newValue
            }
        }
        get {
            return _numberOfTouches
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.isUserInteractionEnabled = true
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count <= numberOfTouches  {
            self.delegate?.buttonPressed(target: self)
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count <= numberOfTouches  {
            if let buttonReleased = delegate?.buttonReleased {
                buttonReleased(self)
            }
        }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.count <= numberOfTouches  {
            if let buttonReleased = delegate?.buttonReleased {
                buttonReleased(self)
            }
        }
    }
    
}

