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
    
    @IBOutlet weak var passwordText: UITextField!
    
    var token: String?
    var doctor: Doctor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logIn(sender: AnyObject) {
        
        var dictionary = ["id": textIDtxt.text, "password": passwordText.text]
        
        if NSJSONSerialization.isValidJSONObject(dictionary) {
            
            var err: NSError?
            
            let dataObject: NSData = NSJSONSerialization.dataWithJSONObject(dictionary, options: nil, error: &err)!
            
            let baseURL = NSURL(string: "https://aura-app.herokuapp.com/doctor/authenticate")
            
            let request = NSMutableURLRequest(URL: baseURL!)
            request.HTTPMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = dataObject
            
            
            var response: NSURLResponse?
            
            var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
            
            if let httpResponse = response as? NSHTTPURLResponse {
                
                token = httpResponse.allHeaderFields["Etag"] as? String
                
                println("\(token)")
                
                let doctorDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as! NSDictionary
                
                if doctorDictionary.count > 0 {
                    doctor = Doctor(doctorDictionary: doctorDictionary)
                    doctor!.id = textIDtxt.text
                    doctor!.token = token!
                    
                    performSegueWithIdentifier("getDoctor", sender: sender)
                }
                else {
                    textIDtxt.text = ""
                    passwordText.text = ""
                }
                
            }
            else {
                textIDtxt.text = ""
                passwordText.text = ""
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "getDoctor" {
            let doctorViewController = segue.destinationViewController as! DoctorViewController
            doctorViewController.doctor = doctor
        }
    }
}

