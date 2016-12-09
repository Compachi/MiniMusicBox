//
//  KeyboardViewController.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import UIKit
import AVFoundation

class KeyboardViewController: UIViewController {
    let keyboardModel = KeyboardModel();
    var audioPlayer = AVAudioPlayer()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "40", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func cSharpPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "41", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func dPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "42", ofType: "wav", inDirectory: "Piano Sounds")
        // copy this syntax, it tells the compiler what to do when action is received
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func dSharpPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "43", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func ePressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "44", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func fPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "45", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func fSharpPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "46", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func gPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "47", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func gSharpPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "48", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func aPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "49", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }

    @IBAction func aSharpPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "50", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func bPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "51", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func octaveCPressed(_ sender: AnyObject) {
        let pianoNote = Bundle.main.path(forResource: "52", ofType: "wav", inDirectory: "Piano Sounds")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: pianoNote!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
}
