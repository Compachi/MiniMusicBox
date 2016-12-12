//
//  MetronomeModel.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import Foundation
import AVFoundation


class MetronomeModel {
    
    fileprivate var metronomeTimer: Timer!
    fileprivate var tickSound = AVAudioPlayer()
    fileprivate var tockSound = AVAudioPlayer()
    
    func prepareMetronomeAudio() {
        //Tick
        let tick = Bundle.main.path(forResource: "tick", ofType: "wav", inDirectory: "Metronome Sounds")
        do {
            tickSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: tick!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        //Tock for offbeats. 
        let tock = Bundle.main.path(forResource: "tock", ofType: "wav", inDirectory: "Metronome Sounds")
        do {
            tockSound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: tock!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
    }
    
    func tick() {
        tickSound.play()
    }
    
    func tock() {
        tockSound.play()
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
