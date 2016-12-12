//
//  ViewController.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var optionButtonsOutletCollection: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        formatOptionButtons()
    }

    
    func formatOptionButtons() {
        for buttons in optionButtonsOutletCollection {
            buttons.layer.borderWidth = 1.0
            buttons.layer.cornerRadius = 5
        }
    }
    //Keyboard
    @IBAction func keyboardButtonPressed(_ sender: AnyObject) {
        //print("There's a Bill Evans in all of us.")
        performSegue(withIdentifier: "Keyboard", sender: nil)
    }
    
    //Tuner
    @IBAction func guitarTunerButtonPressed(_ sender: AnyObject) {
        //print("You can tune a piano, but you can't tune a fish. *ba dum tsh*")
        performSegue(withIdentifier: "Tuner", sender: nil)
    }
    
    //Metronome
    @IBAction func metronomeButtonPressed(_ sender: AnyObject) {
        //print("NOT MY ****ING TEMPO! (I highly recommend watching Whiplash if you haven't already)")
        performSegue(withIdentifier: "Metronome", sender: nil)
    }
    


}

