//
//  ViewController.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func keyboardButtonPressed(_ sender: AnyObject) {
        print("KEYBOARD")
        performSegue(withIdentifier: "Keyboard", sender: nil)
    }
    
    
    @IBAction func guitarTunerButtonPressed(_ sender: AnyObject) {
        print("TUNER")
        performSegue(withIdentifier: "Tuner", sender: nil)
    }
    
    
    @IBAction func metronomeButtonPressed(_ sender: AnyObject) {
        print("METRONOME")
        performSegue(withIdentifier: "Metronome", sender: nil)
    }
    


}

