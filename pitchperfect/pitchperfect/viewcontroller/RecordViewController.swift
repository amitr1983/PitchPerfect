//
//  RecordViewController.swift
//  pitchperfect
//
//  Created by amit kumar on 6/17/18.
//  Copyright © 2018 amit kumar. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var recordBtn: UIButton!
    
    @IBOutlet weak var recordingInfoLabel: UILabel!
    
    @IBOutlet weak var stopBtn: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stopBtn?.isHidden=false
    }
    
    //Record voice when user tap on record
    @IBAction func record(_ sender: Any) {
        print("Recording is in progress")
        configureUI(true)
        
        // Declare directory path where i'm planning to store recording clip
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask , true)[0] as String
        let fileName = "testrecording.wav"
        let pathArray=[dirPath,fileName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session=AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
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
        configureUI(false)
        audioRecorder.stop()
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished recording")
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Got an error")
            configureUI(false)
        }
    }
    
    // Send recorded file's url to playviewcontroller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundVC.recordedAudioURL = recordedAudioURL
        }
    }


    func configureUI(_ isRecording:Bool = false) {
        print("Recording is in progress")
        recordingInfoLabel.text = isRecording ? "Recording in progress": "Tap to start Recording"
        recordBtn.isEnabled = !isRecording
        recordBtn.isHidden = isRecording
        stopBtn.isEnabled = isRecording
        stopBtn.isHidden = !isRecording
    }
    
}
