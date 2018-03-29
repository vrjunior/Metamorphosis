//
//  AudioHelper.swift
//  Metamorphosis-XCODE
//
//  Created by Valmir Junior on 22/03/18.
//  Copyright © 2018 Valmir Junior. All rights reserved.
//

import Foundation
import AVFoundation

public enum AudioType: String {
    case first = "HabaneraByBizet.mp3"
    case second = "MorningMoodbyGrieg.mp3"
    case third = "WaltzOfTheFlowersByTchaikovsky.mp3"
    case popBubble = "popBubble.mp3"
}

public class AudioHelper {
    
    private var audioPlayer: AVAudioPlayer?
    
    init(audio: AudioType) {
        do {
            if let url = Bundle.main.url(forResource: audio.rawValue, withExtension: nil) {
                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                
                self.audioPlayer?.prepareToPlay()
                
            }
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    public func play() {
        
        if let audioPlayer = self.audioPlayer {
            // negative to loop infinite
            audioPlayer.numberOfLoops = -1
            
            audioPlayer.play()
        }
    }
    
    public func playOnce() {
        if let audioPlayer = self.audioPlayer {
            audioPlayer.play()
        }
    }
    
}
