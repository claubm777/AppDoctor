//
//  ViewController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textIDtxt: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "getDoctor" {
            
            let baseURL = NSURL(string: "https://aura-app.herokuapp.com/api/doctor/")
            let doctorURL = NSURL(string: textIDtxt.text, relativeToURL: baseURL)
            println(doctorURL)
            
            let dataObject = NSData(contentsOfURL: doctorURL!)
            println(dataObject)
            let doctorDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
            
            println(doctorDictionary)
            
            let currentDoctor = Doctor(doctorDictionary: doctorDictionary)
            println(currentDoctor)
            let doctorViewController = segue.destinationViewController as DoctorViewController
            println("yyyyyyyy")
            doctorViewController.doctor = currentDoctor
            currentDoctor.id = textIDtxt.text
        }
        
        
    }
    
    
    

}

