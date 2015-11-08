//
//  ViewController.swift
//  sesKayitSwift3
//
//  Created by ÖZLEM ATABAY on 8.11.2015.
//  Copyright (c) 2015 ÖZLEM ATABAY. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var btnOStop: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    
    @IBAction func btnStop(sender: AnyObject) {
        audioRecorder.stop()
    }
    @IBAction func btnRec(sender: AnyObject) {
        btnOStop.hidden=false
        lblRecording.hidden=false
        
        //TODO: Record Audio fnc
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        // self.title="Record"
      // lblRecording.hidden=true
       // btnOStop.hidden=true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        btnOStop.hidden=true
        lblRecording.hidden=true
    }


}

