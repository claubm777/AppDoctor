//
//  DoctorViewController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class DoctorViewController: UIViewController {
    
    
    var doctor: Doctor?
    var patient: Patient?
    
    @IBOutlet weak var textID: UITextField!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var disciplineLabel: UILabel!
    @IBOutlet weak var doctorNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if doctor != nil {
            
            doctorNameLabel.text = doctor!.name
            mailLabel.text = doctor!.mail
            disciplineLabel.text = "\(doctor!.discipline)"
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func search(sender: AnyObject) {
        
        var err: NSError?
        
        let baseURL = NSURL(string: "https://aura-app.herokuapp.com/api/patient/\(textID.text)")
        
        let request = NSMutableURLRequest(URL: baseURL!)
        request.HTTPMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var encriptador: Security = Security()
        var tokenEncriptado = encriptador.encriptando(doctor!.token)
        println(tokenEncriptado)
        
        request.addValue("\(tokenEncriptado)", forHTTPHeaderField: "auth-token")
        request.addValue("DOC", forHTTPHeaderField: "who")
        request.addValue("\(doctor!.id)", forHTTPHeaderField: "id")
        
        var response: NSURLResponse?
        
        var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: nil) as NSData?
        
        if let httpResponse = response as? NSHTTPURLResponse {
            let patientDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as! NSDictionary
            
            println(patientDictionary)
            
            if patientDictionary.count > 0 {
                patient = Patient(patientDictionary: patientDictionary)
                
                if patient != nil {
                    performSegueWithIdentifier("getPatient", sender: sender)
                }
            }
            else {
                textID.text = ""
            }
            
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "getPatient" {
            let patientViewController = segue.destinationViewController as! PatientViewController
            patientViewController.patient = patient!
            patient!.id = textID.text
        }
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
