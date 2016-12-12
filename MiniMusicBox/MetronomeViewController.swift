//
//  MetronomeViewController.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import UIKit
import AVFoundation

class MetronomeViewController: UIViewController {
    
    fileprivate let metronomeModel = MetronomeModel()
    @IBOutlet weak var bpmLabelOutlet: UILabel!
    @IBOutlet weak var offOnOutlet: UISwitch!
    @IBOutlet weak var bpmSliderOutlet: UISlider!
    @IBOutlet weak var metronomeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metronomeModel.prepareMetronomeAudio()
    }
    
    //If user tries to slide back to option controller, invalidates timer and turns off metronome switch.
    override func viewWillDisappear(_ animated: Bool) {
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            offOnOutlet.isOn = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func offOnSwitch(_ sender: AnyObject) {
        if offOnOutlet.isOn {
            metronomeModel.startMetronome()
        } else {
            metronomeModel.stopMetronome()
        }
    }
    
    @IBAction func bpmSlider(_ sender: AnyObject) {
        bpmLabelOutlet.text = "\(Int(bpmSliderOutlet.value))"
        metronomeModel.tempo = Int(bpmSliderOutlet.value)
        
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            metronomeModel.startMetronome()
        }
    }
}
