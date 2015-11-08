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
    var rate: Float = 1
    
    @IBOutlet weak var btnAFast: UIButton!
    
    
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
            if var filePath=NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        {
            var filePathURL = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathURL, error: nil)
            audioPlayer.enableRate = true
        }
            else
        {
            println("Can not find sound file")
        }
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
