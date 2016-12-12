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
    
    var metronomeModel = MetronomeModel()
    @IBOutlet weak var bpmLabelOutlet: UILabel!
    @IBOutlet weak var offOnOutlet: UISwitch!
    @IBOutlet weak var bpmSliderOutlet: UISlider!
    @IBOutlet weak var metronomeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metronomeModel.prepareMetronomeAudio()
        metronomeModel.tick()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



    @IBAction func offOnSwitch(_ sender: AnyObject) {
        metronomeModel.tock()
    }
    
    @IBAction func bpmSlider(_ sender: AnyObject) {
        bpmLabelOutlet.text = "\(Int(bpmSliderOutlet.value))"
        metronomeModel.tick()
    }
 
    


}
