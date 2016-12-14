//
//  MetronomeViewController.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

import UIKit

class MetronomeViewController: UIViewController {
    
    fileprivate var tempoFromCoreData: [BpmLabelEntity] = []
    fileprivate let metronomeModel = MetronomeModel()
    fileprivate var previousMetronomeImageViewImage = ""
    @IBOutlet weak var bpmLabelOutlet: UILabel!
    @IBOutlet weak var offOnOutlet: UISwitch!
    @IBOutlet weak var bpmSliderOutlet: UISlider!
    @IBOutlet weak var metronomeImageView: UIImageView!
    @IBOutlet var tempoSubdivisionOutletCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultMetronomeImageViewImage()
        formatSubdivisionButtons()
        metronomeModel.prepareMetronomeAudio()
        retrieveCoreDataForBpmLabelValue()
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

    //I'm using another variable to keep track of the previous image. This way the image view won't animate again if the same tempo subdivision option is chosen again.
    func setDefaultMetronomeImageViewImage() {
        metronomeImageView.image = UIImage(named: "quarter.png")
        previousMetronomeImageViewImage = "quarter.png"
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
        saveBpmLabelToCoreData(bpmValue: bpmLabelOutlet.text!)
        
    }
    
    func resetButtonsAfterSelection() {
        for buttons in tempoSubdivisionOutletCollection {
            buttons.backgroundColor = UIColor.lightGray
        }
    }
    
    func animateMetronomeView(notePicture: String) {
        if notePicture != previousMetronomeImageViewImage {
            UIView.transition(with: self.metronomeImageView, duration: 0.35, options: .transitionCurlUp, animations: {
                    self.metronomeImageView.image = UIImage(named: notePicture)
                }, completion: nil)
            }
    }
    
    func saveBpmLabelToCoreData(bpmValue: String) {
        //Get context and save to core data
        let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let labelEntity = BpmLabelEntity(context: ctx)
        labelEntity.bpmLabel = bpmLabelOutlet.text
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let labelString = NSString(format: "%@", labelEntity.bpmLabel!)
        metronomeModel.tempo = Int(labelString.intValue)
        print(labelString)
    }
    
    func retrieveCoreDataForBpmLabelValue() {
        //Get context and retrieve from core data
        let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            print("TRYING TO RETRIEVE DATA")
            tempoFromCoreData = try ctx.fetch(BpmLabelEntity.fetchRequest())
            if tempoFromCoreData.count > 0 {
                //Only need last element
                let labelString = NSString(format: "%@", tempoFromCoreData[tempoFromCoreData.count - 1].bpmLabel!)
                //print(labelString)
                bpmLabelOutlet.text = labelString as String
                metronomeModel.tempo = Int(labelString.intValue)
                bpmSliderOutlet.setValue(Float(metronomeModel.tempo), animated: false)
            } else { //If we have yet to save any data, we will use the default bpm and set the slider accordingly
                print("Defaults Used.")
                bpmLabelOutlet.text = "120"
                metronomeModel.tempo = 120
                bpmSliderOutlet.setValue(Float(metronomeModel.tempo), animated: false)
            }
        } catch {
            print("ERROR FETCHING DATA!")
        }
    }
}

//MARK: I created another extension similar to the keyboard controller. This one is for the subdivision buttons.
extension MetronomeViewController {
        
    @IBAction func quarterNotePressed(_ sender: AnyObject) {
        animateMetronomeView(notePicture: "quarter.png")
        previousMetronomeImageViewImage = "quarter.png"
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
        animateMetronomeView(notePicture: "8th.png")
        previousMetronomeImageViewImage = "8th.png"
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
        animateMetronomeView(notePicture: "triplet.png")
        previousMetronomeImageViewImage = "triplet.png"
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
        animateMetronomeView(notePicture: "16th.png")
        previousMetronomeImageViewImage = "16th.png"
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
}

