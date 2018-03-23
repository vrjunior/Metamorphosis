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
}

public class AudioHelper {
    
    private var playingAudio: AudioType!
    public static let shared = AudioHelper()
    
    fileprivate init() {
        
        self.play(audio: .first)
        
    }
    
    
    public func play(audio: AudioType) {
        if self.playingAudio != audio {
            do {
                if let url = Bundle.main.url(forResource: audio.rawValue, withExtension: nil) {
                    let audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer.prepareToPlay()
                    
                    audioPlayer.play()
                    self.playingAudio = audio
                    print("audio")
                }
            }
            catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}
