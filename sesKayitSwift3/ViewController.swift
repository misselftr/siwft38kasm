//
//  ViewController.swift
//  sesKayitSwift3
//
//  Created by ÖZLEM ATABAY on 8.11.2015.
//  Copyright (c) 2015 ÖZLEM ATABAY. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!
    var recordedAudio: RecordedAudio!

    @IBOutlet weak var btnOStop: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    
    @IBAction func btnStop(sender: AnyObject) {
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
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
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.meteringEnabled = true
        audioRecorder.delegate = self
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
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if (flag)
        {
            
            // RECORD
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            
            //SEGUE
            
            performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
        else
        {
            println("Error recording!")
            btnOStop.hidden=true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier=="stopRecording")
        {
            let playSoundsVC: SecondViewController = segue.destinationViewController as! SecondViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        btnOStop.hidden=true
        lblRecording.hidden=true
    }


}

