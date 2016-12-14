//
//  GuitarTunerViewController.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import UIKit
import AVFoundation

class GuitarTunerViewController: UIViewController {
    
    fileprivate let guitarModel = GuitarModel()
    @IBOutlet weak var resetButtonOutlet: UIButton!
    @IBOutlet var guitarStringOutletCollection: [UISwitch]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guitarModel.prepareGuitarAudio()
        guitarModel.setSoundLoops()
    }

    @IBAction func eStringSwitched(_ sender: AnyObject) {
        if guitarStringOutletCollection[0].isOn {
            guitarModel.playEString()
        } else {
            guitarModel.stopEString()
        }
    }
    
    @IBAction func aStringSwitched(_ sender: AnyObject) {
        if guitarStringOutletCollection[1].isOn {
            guitarModel.playAString()
        } else {
            guitarModel.stopAString()
        }

    }
    
    @IBAction func dStringSwitched(_ sender: AnyObject) {
        if guitarStringOutletCollection[2].isOn {
            guitarModel.playDString()
        } else {
            guitarModel.stopDString()
        }
    }
    
    @IBAction func gStringSwitched(_ sender: AnyObject) {
        if guitarStringOutletCollection[3].isOn {
            guitarModel.playGString()
        } else {
            guitarModel.stopGString()
        }
    }
    
    @IBAction func bStringSwitched(_ sender: AnyObject) {
        if guitarStringOutletCollection[4].isOn {
            guitarModel.playBString()
        } else {
            guitarModel.stopBString()
        }
    }
    
    @IBAction func octaveEStringSwitched(_ sender: AnyObject) {
        if guitarStringOutletCollection[5].isOn {
            guitarModel.playOctaveEString()
        } else {
            guitarModel.stopOctaveEString()
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: AnyObject) {
        for switches in guitarStringOutletCollection {
            switches.isOn = false
        }
        guitarModel.stopEString()
        guitarModel.stopAString()
        guitarModel.stopDString()
        guitarModel.stopGString()
        guitarModel.stopBString()
        guitarModel.stopOctaveEString()
    }
    
}
