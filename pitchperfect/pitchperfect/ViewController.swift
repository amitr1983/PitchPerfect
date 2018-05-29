//
//  ViewController.swift
//  pitchperfect
//
//  Created by amit kumar on 3/20/18.
//  Copyright © 2018 amit kumar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordBtn: UIButton!
    
    @IBOutlet weak var recordingInfoLabel: UILabel!
    
    @IBOutlet weak var stopBtn: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    let session=AVAudioSession.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        stopBtn?.isHidden=false
    }
    
    @IBAction func record(_ sender: Any) {
        print("Recording is in progress")
        recordingInfoLabel.text="Tap to finish Recording"
        recordBtn.isHidden=true
        stopBtn.isHidden=false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask , true)[0] as String
        let fileName = "testrecording.wav"
        let pathArray=[dirPath,fileName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! session.setActive(true)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self
        print(filePath)
        
        audioRecorder.isMeteringEnabled=true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecoring(_ sender: Any) {
        print("Stopped Recording")
        recordingInfoLabel.text="Tap to start Recording"
        recordBtn.isHidden=false
        stopBtn.isHidden=true
        audioRecorder.stop()
        try! session.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished recording")
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Got an error")
        }
    }
    
    
}

