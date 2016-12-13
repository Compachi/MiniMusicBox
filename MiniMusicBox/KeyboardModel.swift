//
//  KeyboardModel.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import Foundation
import AVFoundation
import CoreData

class KeyboardModel {
    
    //I originally just had one AVAudioPlayer() variable, but having one for each note allows you to play different keys rapidly without cutting the sound from switching notes (will however reset the sound if the same key is pressed similar to repeatedly hitting the same key over and over on a real piano by dampening and restriking the string).
    var octaveStepper = 0
    fileprivate var pianoNote: String = ""
    fileprivate var cAudio = AVAudioPlayer()
    fileprivate var cSharpAudio = AVAudioPlayer()
    fileprivate var dAudio = AVAudioPlayer()
    fileprivate var dSharpAudio = AVAudioPlayer()
    fileprivate var eAudio = AVAudioPlayer()
    fileprivate var fAudio = AVAudioPlayer()
    fileprivate var fSharpAudio = AVAudioPlayer()
    fileprivate var gAudio = AVAudioPlayer()
    fileprivate var gSharpAudio = AVAudioPlayer()
    fileprivate var aAudio = AVAudioPlayer()
    fileprivate var aSharpAudio = AVAudioPlayer()
    fileprivate var bAudio = AVAudioPlayer()
    fileprivate var octaveCAudio = AVAudioPlayer()
    

    //MARK: Assign the sound file for each key pressed. For the octave stepper, -1 corresponds to the octave below middle C on the piano, 0 is for the octave starting at middle C and 1 is for the octave above middle C.
    func cKey() {
        if octaveStepper == -1 {
            self.pianoNote = "28"
        } else if octaveStepper == 0 {
            self.pianoNote = "40"
        } else {
            self.pianoNote = "52"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            cAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        cAudio.play()
    }
    
    func cSharpKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "29"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "41"
        } else {
            self.pianoNote = "53"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            cSharpAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        cSharpAudio.play()
    }
    
    func dKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "30"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "42"
        } else {
            self.pianoNote = "54"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        // copy this syntax, it tells the compiler what to do when action is received
        do {
            dAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        dAudio.play()
    }
    
    func dSharpKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "31"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "43"
        } else {
            self.pianoNote = "55"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            dSharpAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        dSharpAudio.play()
    }
    
    func eKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "32"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "44"
        } else {
            self.pianoNote = "56"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            eAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        eAudio.play()
    }
    
    func fKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "33"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "45"
        } else {
            self.pianoNote = "57"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            fAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        fAudio.play()
    }
    
    func fSharpKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "34"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "46"
        } else {
            self.pianoNote = "58"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            fSharpAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        fSharpAudio.play()
    }
    
    func gKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "35"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "47"
        } else {
            self.pianoNote = "59"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            gAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        gAudio.play()
    }
    
    func gSharpKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "36"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "48"
        } else {
            self.pianoNote = "60"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            gSharpAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        gSharpAudio.play()
    }
    
    func aKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "37"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "49"
        } else {
            self.pianoNote = "61"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            aAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        aAudio.play()
    }
    
    func aSharpKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "38"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "50"
        } else {
            self.pianoNote = "62"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            aSharpAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        aSharpAudio.play()
    }
    
    func bKey() {
        if self.octaveStepper == -1 {
            self.pianoNote = "39"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "51"
        } else {
            self.pianoNote = "63"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            bAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        bAudio.play()
    }
    
    func octaveC() {
        if self.octaveStepper == -1 {
            self.pianoNote = "40"
        } else if self.octaveStepper == 0 {
            self.pianoNote = "52"
        } else {
            self.pianoNote = "64"
        }
        let pianoNote = Bundle.main.path(forResource: self.pianoNote, ofType: "wav", inDirectory: "Piano Sounds")
        do {
            octaveCAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        octaveCAudio.play()
    }
}
