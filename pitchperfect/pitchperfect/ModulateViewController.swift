//
//  ModulateViewController.swift
//  pitchperfect
//
//  Created by amit kumar on 5/28/18.
//  Copyright © 2018 amit kumar. All rights reserved.
//

import UIKit
import AVFoundation

class ModulateViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var slowBtn: UIButton!
    
    @IBOutlet weak var fastBtn: UIButton!
    
    @IBOutlet weak var revervBtn: UIButton!
    
    @IBOutlet weak var chipMunkBtn: UIButton!
    
    @IBOutlet weak var darthBtn: UIButton!
    
    @IBOutlet weak var echo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundBtn(_ sender: UIButton) {
        print("Start sound")
        
    }
    
    @IBAction func stopSoundBtn(_ sender: Any) {
        print("Stop sound")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
