//
//  AudioHelper.swift
//  Metamorphosis-XCODE
//
//  Created by Valmir Junior on 22/03/18.
//  Copyright © 2018 Valmir Junior. All rights reserved.
//

import Foundation
import AVFoundation

enum AudioType: String {
    case first = "Habanera_by_Bizet.mp3"
}

class AudioHelper {
    
    private var playingAudio: AudioType!
    public static let shared = AudioHelper()
    
    fileprivate init() {
        self.playingAudio = .first
        
        self.play(audio: playingAudio)
    }
    
    
    public func play(audio: AudioType) {
        if self.playingAudio != audio {
            do {
                if let url = Bundle.main.url(forResource: audio.rawValue, withExtension: nil) {
                    let audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer.play()
                }
            }
            catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}
