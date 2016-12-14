//
//  MetronomeModel.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

class MetronomeModel {
    
    var tempo = 120
    var subdivision = 1.0
    var metronomeTimer: Timer!
    var subdividedTimer: Timer!
    fileprivate var tickSound = AVAudioPlayer()
    fileprivate var tockSound = AVAudioPlayer()
    
    //Load audio file
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
        tickSound.prepareToPlay()
    }
    
    //If user selects to subdivide the time into eighth notes, triplets, or sixteenths, we'll initialize the second timer.
    func startMetronome() {
        metronomeTimer = Timer.scheduledTimer(timeInterval: TimeInterval(TimeInterval(60.0) / TimeInterval(tempo)), target: self, selector: #selector(MetronomeModel.tick), userInfo: nil, repeats: true)
        if subdivision > 1 {
            subdividedTimer = Timer.scheduledTimer(timeInterval: TimeInterval((TimeInterval(60.0) / TimeInterval(tempo)) / TimeInterval(subdivision)), target: self, selector: #selector(MetronomeModel.tock), userInfo: nil, repeats: true)
            subdividedTimer.fire()
        }
        metronomeTimer.fire()
    }
    
    @objc fileprivate func tick() {
        tickSound.play()
    }
    //MARK: I originally had planned to use two audio files, but when the BPM gets too high, the second sound file can't keep up with the subdivided tempo. I opted to use one of the system sounds instead. And it seems to work just fine. The odds of somebody really needing sixteenth notes at 240 beats per minute is most likely zero, but still...
    @objc fileprivate func tock() {
        AudioServicesPlaySystemSound(1103)
    }
    
    func stopMetronome() {
        metronomeTimer.invalidate()
        if subdivision > 1.0 {
            subdividedTimer.invalidate()
        }
        tickSound.stop()
    }
}
