//
//  PlaySound.swift
//  challenge_yourself
//
//  Created by tientran on 29/12/2020.
//

import Foundation
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound(sound : String , type : String)  {
    
    guard let path = Bundle.main.path(forResource: sound, ofType: type) else {
        return
    }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
        
    } catch  {
        print("Cant find sound file")
    }
    
}
