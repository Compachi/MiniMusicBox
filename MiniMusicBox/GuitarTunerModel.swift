//
//  GuitarTunerModel.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import Foundation
import AVFoundation

class GuitarModel {
    
    fileprivate var eStringAudio = AVAudioPlayer()
    fileprivate var aStringAudio = AVAudioPlayer()
    fileprivate var dStringAudio = AVAudioPlayer()
    fileprivate var gStringAudio = AVAudioPlayer()
    fileprivate var bStringAudio = AVAudioPlayer()
    fileprivate var octaveEStringAudio = AVAudioPlayer()
    
    
    //MARK: Unlike the piano where the sound files will vary based on the octave chosen, the guitar tuner utilizes only six sounds. So I call this method in viewDidLoad to set all the audio files.
    func prepareGuitarAudio() {
        //Low E
        let eNote = Bundle.main.path(forResource: "e", ofType: "wav", inDirectory: "Guitar Sounds")
        do {
            eStringAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: eNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        //A
        let aNote = Bundle.main.path(forResource: "a", ofType: "wav", inDirectory: "Guitar Sounds")
        do {
            aStringAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: aNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        //D
        let dNote = Bundle.main.path(forResource: "d", ofType: "wav", inDirectory: "Guitar Sounds")
        do {
            dStringAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        //G
        let gNote = Bundle.main.path(forResource: "g", ofType: "wav", inDirectory: "Guitar Sounds")
        do {
            gStringAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: gNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        //B
        let bNote = Bundle.main.path(forResource: "b", ofType: "wav", inDirectory: "Guitar Sounds")
        do {
            bStringAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        //Octave E
        let octaveENote = Bundle.main.path(forResource: "highe", ofType: "wav", inDirectory: "Guitar Sounds")
        do {
            octaveEStringAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: octaveENote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        
        eStringAudio.prepareToPlay()
        aStringAudio.prepareToPlay()
        dStringAudio.prepareToPlay()
        gStringAudio.prepareToPlay()
        bStringAudio.prepareToPlay()
        octaveEStringAudio.prepareToPlay()
    }
    //If 20 loops isn't long enough to tune ONE guitar string...
    func setSoundLoops(){
        eStringAudio.numberOfLoops = 20
        aStringAudio.numberOfLoops = 20
        dStringAudio.numberOfLoops = 20
        gStringAudio.numberOfLoops = 20
        bStringAudio.numberOfLoops = 20
        octaveEStringAudio.numberOfLoops = 20
    }
    
    //When user switches one of the strings on, sound file will begin playing over and over 20 times. Once user switches note off, it stops the file and resets file to beginning and resets loops.
    func playEString() {
        eStringAudio.play()
    }
    
    func stopEString() {
        eStringAudio.stop()
        eStringAudio.currentTime = 0
    }
    
    func playAString() {
        aStringAudio.play()
    }
    
    func stopAString() {
        aStringAudio.stop()
        aStringAudio.currentTime = 0
    }
    
    func playDString() {
        dStringAudio.play()
    }
    
    func stopDString() {
        dStringAudio.stop()
        dStringAudio.currentTime = 0
    }
    
    func playGString() {
        gStringAudio.play()
    }
    
    func stopGString() {
        gStringAudio.stop()
        gStringAudio.currentTime = 0
    }
    
    func playBString() {
        bStringAudio.play()
    }
    
    func stopBString() {
        bStringAudio.stop()
        bStringAudio.currentTime = 0
    }
    
    func playOctaveEString() {
        octaveEStringAudio.play()
    }
    
    func stopOctaveEString() {
        octaveEStringAudio.stop()
        octaveEStringAudio.currentTime = 0
    }
}
