//
//  ModulateViewController.swift
//  pitchperfect
//
//  Created by amit kumar on 5/28/18.
//  Copyright © 2018 amit kumar. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    
    @IBOutlet weak var rabbitButton: UIButton!
    
    @IBOutlet weak var reverbButton: UIButton!
    
    @IBOutlet weak var chipmunkButton: UIButton!
    
    @IBOutlet weak var vaderButton: UIButton!
    
    @IBOutlet weak var echoButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    var rate: Float!
    var pitch: Float!
    var echo: Bool!
    var reverb: Bool!
    
    enum ButtonType: Int { case slow = 0, fast, reverb, chipmunk, vader, echo }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Play Sounds View Loaded")
        print(recordedAudioURL)
        // Do any additional setup after loading the view.
        if recordedAudioURL != nil {
            setupAudio()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundBtn(_ sender: UIButton) {
        if recordedAudioURL != nil {
            
            stopButton.isEnabled = true
            stopButton.isHidden = false
            
            print("Start sound")
            switch(ButtonType(rawValue: sender.tag)!) {
            case .slow:
                playSound(rate: 0.5)
            case .fast:
                playSound(rate: 1.5)
            case .chipmunk:
                playSound(pitch: 1000)
            case .vader:
                playSound(pitch: -1000)
            case .echo:
                playSound(echo: true)
            case .reverb:
                playSound(reverb: true)
                
            }
            let disableButton = sender as? UIButton
            disableButton?.isEnabled = false
            
        } else {
            showAlert("Record First", message: "Tap on Record to record voice")
        }
    }
    
    @IBAction func stopSoundBtn(_ sender: Any) {
        print("Stop sound")
        stopAudio()
    }

}