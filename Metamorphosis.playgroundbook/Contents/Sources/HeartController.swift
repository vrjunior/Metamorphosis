//
//  HeartController.swift
//  Metamorphosis_Sources
//
//  Created by Valmir Junior on 27/03/18.
//  Copyright © 2018 Valmir Junior. All rights reserved.
//

import Foundation
import SpriteKit


protocol HeartControllerDelegate {
    func spawn()
}

class HeartController {
    
    private var timerSpawnInterval: Timer?
    public var delegate: HeartControllerDelegate?
    
    
    init() {
        self.setTimerSpawn(interval: 1.5)
    }
    
    public func setTimerSpawn(interval: TimeInterval) {
        self.timerSpawnInterval?.invalidate()
        self.timerSpawnInterval = nil
        
        self.timerSpawnInterval = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(HeartController.spawn), userInfo: nil, repeats: true)
    }
    
    @objc func spawn() {
        self.delegate?.spawn()
    }
    
}
