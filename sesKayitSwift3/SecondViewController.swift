//
//  SecondViewController.swift
//  
//
//  Created by ÖZLEM ATABAY on 8.11.2015.
//
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    
    //NSBundle herhangi bir ya da daha fazla dosyanın yolunu verir.
    
    var audioPlayer: AVAudioPlayer!
   // var audioShifter: AVAudioPlayerNode!
    var receivedAudio: RecordedAudio!
 // TEST  var engine: AVAudioEngine!
   
    /* engine = AVAudioEngine()
    playerNode = AVAudioPlayerNode()
    engine.attachNode(playerNode)*/
    
    @IBAction func btnLowPitch(sender: AnyObject) {
        
        
    }
    
    @IBOutlet weak var btnAFast: UIButton!
    
    @IBAction func btnHighPitch(sender: AnyObject) {
        
        //audioPlayer.play()
    }
    
    @IBAction func btnStopSound(sender: AnyObject) {
        audioPlayer.stop()
    }
    
    @IBAction func btnFast(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5;
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    @IBAction func btnASlow(sender: AnyObject) {
        audioPlayer.stop()
       audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0
        audioPlayer.play()
      //  audioPlayer
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Play"
        // Do any additional setup after loading the view.
       
        // Bir yerde bulunan sesi çalan kod parçası. Kendi sesimizi laydedeceksek bu artık gereksiz.
        /*     if var filePath=NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        {
            var filePathURL = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathURL, error: nil)
            audioPlayer.enableRate = true
        }
            else
        {
            println("Can not find sound file")
        }*/
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate=true
        
        //TEST
      /*  audioShifter = AVAudioPlayerNode()
        engine.attachNode(audioShifter)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
