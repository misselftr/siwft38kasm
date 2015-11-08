//
//  ViewController.swift
//  sesKayitSwift3
//
//  Created by ÖZLEM ATABAY on 8.11.2015.
//  Copyright (c) 2015 ÖZLEM ATABAY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnOStop: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    @IBAction func btnStop(sender: AnyObject) {
        
    }
    @IBAction func btnRec(sender: AnyObject) {
        btnOStop.hidden=false
        lblRecording.hidden=false
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

