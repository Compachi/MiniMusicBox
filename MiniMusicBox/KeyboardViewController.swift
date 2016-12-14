//
//  KeyboardViewController.swift
//  MiniMusicBox
//
//  Created by Kyle Lessnau on 12/7/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//
//  The day is the 12th of December in the year 2016. Current Time: 3:04 AM.
//  Today is the day I have come to understand why others before me have said
//  that "constraints are a bitch".

import UIKit
import CoreData

class KeyboardViewController: UIViewController {
    fileprivate let keyboardModel = KeyboardModel();
    fileprivate var octaveFromCoreData: [OctaveLabelEntity] = []
    @IBOutlet var pianoKeyOutletCollection: [UIButton]!
    @IBOutlet weak var octaveLabelOutlet: UILabel!
    @IBOutlet weak var octaveUpOutlet: UIButton!
    @IBOutlet weak var octaveDownOutlet: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        formatKeyboardButtonsAndLabels()
        retrieveCoreDataForOctaveLabelValue()
    }
        
    //Borders and rounded corners for piano keys. Rotates octave buttons and octave label as well
    func formatKeyboardButtonsAndLabels() {
        for pianoKey in pianoKeyOutletCollection {
            pianoKey.layer.borderWidth = 1.5
            pianoKey.layer.cornerRadius = 5
        }
        
        octaveDownOutlet.transform = CGAffineTransform(rotationAngle: 3 * (CGFloat.pi / 2))
        octaveUpOutlet.transform = CGAffineTransform(rotationAngle: 3 * (CGFloat.pi / 2))
        octaveLabelOutlet.transform = CGAffineTransform(rotationAngle: 3 * (CGFloat.pi / 2))
    }
    
    //Animate keys after being pressed
    func animateKey(key: Int) {
        UIView.animate(withDuration: 0.10, animations:{
            self.pianoKeyOutletCollection[key].frame =
                self.CGRectMake(self.pianoKeyOutletCollection[key].frame.origin.x + 5,
                                self.pianoKeyOutletCollection[key].frame.origin.y + 5,
                                self.pianoKeyOutletCollection[key].frame.size.width,
                                self.pianoKeyOutletCollection[key].frame.size.height)
        })
        
        UIView.animate(withDuration: 0.10, animations:{
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200), execute: {
                self.pianoKeyOutletCollection[key].frame =
                    self.CGRectMake(self.pianoKeyOutletCollection[key].frame.origin.x - 5,
                                    self.pianoKeyOutletCollection[key].frame.origin.y - 5,
                                    self.pianoKeyOutletCollection[key].frame.size.width,
                                    self.pianoKeyOutletCollection[key].frame.size.height)
            })
        })
    }
    
    //Redefine CGRectMake for Swift 3. Used for animating piano keys.
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    //Functions will change the octave of the piano and save octaves in core data.
    @IBAction func octaveUpButton(_ sender: AnyObject) {
        keyboardModel.octaveStepper += 1
        if keyboardModel.octaveStepper > 1 {
            keyboardModel.octaveStepper = 1
        }
        octaveLabelOutlet.text = "\(keyboardModel.octaveStepper)"
        saveOctaveLabelToCoreData(octaveValue: octaveLabelOutlet.text!)
    }
    
    @IBAction func octaveDownButton(_ sender: AnyObject) {
        keyboardModel.octaveStepper -= 1
        if keyboardModel.octaveStepper < -1 {
            keyboardModel.octaveStepper = -1
        }
        octaveLabelOutlet.text = "\(keyboardModel.octaveStepper)"
        saveOctaveLabelToCoreData(octaveValue: octaveLabelOutlet.text!)
    }
    
    func saveOctaveLabelToCoreData(octaveValue: String) {
        //Get context and save to core data
        let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let labelEntity = OctaveLabelEntity(context: ctx)
        labelEntity.octaveLabel = octaveValue
        //labelEntity.octaveLabel = octaveLabelOutlet.text
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let labelString = NSString(format: "%@", labelEntity.octaveLabel!)
        keyboardModel.octaveStepper = Int(labelString.intValue)
        //print(labelString)
    }
    
    func retrieveCoreDataForOctaveLabelValue() {
        //Get context and retrieve from core data
        let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            print("TRYING TO RETRIEVE DATA")
            octaveFromCoreData = try ctx.fetch(OctaveLabelEntity.fetchRequest())
            
            if octaveFromCoreData.count > 0 {
                //Only need last element
                let labelString = NSString(format: "%@", octaveFromCoreData[octaveFromCoreData.count - 1].octaveLabel!)
                octaveLabelOutlet.text = labelString as String
                keyboardModel.octaveStepper = Int(labelString.intValue)
            } else { //If we have yet to save any data, we will use the default octave.
                //print("Defaults used.")
                octaveLabelOutlet.text = "0"
                keyboardModel.octaveStepper = 0
            }
        } catch {
            print("ERROR FETCHING DATA!")
        }
    }
}

//MARK: Extension primarily for easier readability. Includes 13 actions for piano keys. 
extension KeyboardViewController {
    
    //Do
    @IBAction func cPressed(_ sender: AnyObject) {
        keyboardModel.cKey()
        animateKey(key: 12)
    }
    
    //Di
    @IBAction func cSharpPressed(_ sender: AnyObject) {
        keyboardModel.cSharpKey()
        animateKey(key: 11)
    }
    
    //Re
    @IBAction func dPressed(_ sender: AnyObject) {
        keyboardModel.dKey()
        animateKey(key: 10)
    }
    
    //Ri
    @IBAction func dSharpPressed(_ sender: AnyObject) {
        keyboardModel.dSharpKey()
        animateKey(key: 9)
    }
    
    //Mi
    @IBAction func ePressed(_ sender: AnyObject) {
        keyboardModel.eKey()
        animateKey(key: 8)
    }
    
    //Fa
    @IBAction func fPressed(_ sender: AnyObject) {
        keyboardModel.fKey()
        animateKey(key: 7)
    }
    
    //Fi
    @IBAction func fSharpPressed(_ sender: AnyObject) {
        keyboardModel.fSharpKey()
        animateKey(key: 6)
    }
    
    //Sol
    @IBAction func gPressed(_ sender: AnyObject) {
        keyboardModel.gKey()
        animateKey(key: 5)
    }
    
    //Si
    @IBAction func gSharpPressed(_ sender: AnyObject) {
        keyboardModel.gSharpKey()
        animateKey(key: 4)
    }
    
    //La
    @IBAction func aPressed(_ sender: AnyObject) {
        keyboardModel.aKey()
        animateKey(key: 3)
    }
    
    //Li
    @IBAction func aSharpPressed(_ sender: AnyObject) {
        keyboardModel.aSharpKey()
        animateKey(key: 2)
    }
    
    //Ti
    @IBAction func bPressed(_ sender: AnyObject) {
        keyboardModel.bKey()
        animateKey(key: 1)
    }
    
    //Do
    @IBAction func octaveCPressed(_ sender: AnyObject) {
        keyboardModel.octaveC()
        animateKey(key: 0)
    }
}
