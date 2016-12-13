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
    @IBOutlet weak var metronomeImageView: UIImageView!
    @IBOutlet var tempoSubdivisionOutletCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metronomeImageView.image = UIImage(named: "quarter.png")
        formatSubdivisionButtons()
        metronomeModel.prepareMetronomeAudio()
    }
    
    //If user tries to slide back to option controller, invalidates timer(s) and turns off metronome switch.
    override func viewWillDisappear(_ animated: Bool) {
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            if metronomeModel.subdividedTimer != nil {
                metronomeModel.subdividedTimer.invalidate()
            }
            offOnOutlet.isOn = false
        }
    }
    
    func formatSubdivisionButtons() {
        for buttons in tempoSubdivisionOutletCollection {
            buttons.layer.borderWidth = 1
            buttons.layer.cornerRadius = 5
            buttons.backgroundColor = UIColor.lightGray
        }
        //Default is quarter note when the app starts to it's automatically selected.
        tempoSubdivisionOutletCollection[0].backgroundColor = UIColor.gray
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
            if metronomeModel.subdividedTimer != nil {
                metronomeModel.subdividedTimer.invalidate()
            }
            metronomeModel.startMetronome()
        }
    }
    
    func resetButtonsAfterSelection() {
        for buttons in tempoSubdivisionOutletCollection {
            buttons.backgroundColor = UIColor.lightGray
        }
    }
}

//MARK: I created another extension similar to the keyboard controller. This one is for the subdivision buttons.
extension MetronomeViewController {
    
    @IBAction func quarterNotePressed(_ sender: AnyObject) {
        resetButtonsAfterSelection()
        tempoSubdivisionOutletCollection[0].backgroundColor = UIColor.gray
        metronomeModel.subdivision = 1.0
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            if metronomeModel.subdividedTimer != nil  {
                metronomeModel.subdividedTimer.invalidate()
            }
            metronomeModel.startMetronome()
        }
    }
    
    @IBAction func eightNotePressed(_ sender: AnyObject) {
        resetButtonsAfterSelection()
        tempoSubdivisionOutletCollection[1].backgroundColor = UIColor.gray
        metronomeModel.subdivision = 2.0
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            if metronomeModel.subdividedTimer != nil {
                metronomeModel.subdividedTimer.invalidate()
            }
            metronomeModel.startMetronome()
        }
    }
    
    @IBAction func eigthNoteTripletPressed(_ sender: AnyObject) {
        resetButtonsAfterSelection()
        tempoSubdivisionOutletCollection[2].backgroundColor = UIColor.gray
        metronomeModel.subdivision = 3.0
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            if metronomeModel.subdividedTimer != nil {
                metronomeModel.subdividedTimer.invalidate()
            }
            metronomeModel.startMetronome()
        }
    }
    
    @IBAction func sixteenthNotePressed(_ sender: AnyObject) {
        resetButtonsAfterSelection()
        tempoSubdivisionOutletCollection[3].backgroundColor = UIColor.gray
        metronomeModel.subdivision = 4.0
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            if metronomeModel.subdividedTimer != nil {
                metronomeModel.subdividedTimer.invalidate()
            }
            metronomeModel.startMetronome()
        }
    }
    
    @IBAction func eigthNoteQuintupletPressed(_ sender: AnyObject) {
        resetButtonsAfterSelection()
        tempoSubdivisionOutletCollection[4].backgroundColor = UIColor.gray
        metronomeModel.subdivision = 5.0
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            if metronomeModel.subdividedTimer != nil {
                metronomeModel.subdividedTimer.invalidate()
            }
            metronomeModel.startMetronome()
        }
    }
    
    @IBAction func eighthNoteSexupletsPressed(_ sender: AnyObject) {
        resetButtonsAfterSelection()
        tempoSubdivisionOutletCollection[5].backgroundColor = UIColor.gray
        metronomeModel.subdivision = 6.0
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            if metronomeModel.subdividedTimer != nil {
                metronomeModel.subdividedTimer.invalidate()
            }
            metronomeModel.startMetronome()
        }
    }
    
    @IBAction func eighthNoteSeptupletsPressed(_ sender: AnyObject) {
        resetButtonsAfterSelection()
        tempoSubdivisionOutletCollection[6].backgroundColor = UIColor.gray
        metronomeModel.subdivision = 7.0
        if offOnOutlet.isOn {
            metronomeModel.metronomeTimer.invalidate()
            if metronomeModel.subdividedTimer != nil {
                metronomeModel.subdividedTimer.invalidate()
            }
            metronomeModel.startMetronome()
        }
    }
}
