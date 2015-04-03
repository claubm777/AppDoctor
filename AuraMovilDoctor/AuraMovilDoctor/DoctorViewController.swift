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

    @IBOutlet weak var textID: UITextField!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var disciplineLabel: UILabel!
    @IBOutlet weak var doctorNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if doctor != nil {
            
            doctorNameLabel.text = doctor!.name
            
            println("holaa")
            mailLabel.text = doctor!.mail
            disciplineLabel.text = "\(doctor!.discipline)"
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "getPatient" {
            
            let baseURL = NSURL(string: "https://aura-app.herokuapp.com/api/patient/")
            let patientURL = NSURL(string: textID.text, relativeToURL: baseURL)
            
            
            let dataObject = NSData(contentsOfURL: patientURL!)
            let patientDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as NSDictionary
            
            println(patientDictionary)
            
            let currentPatient = Patient(patientDictionary: patientDictionary)
            let patientViewController = segue.destinationViewController as PatientViewController
            println()
            patientViewController.patient = currentPatient
            currentPatient.id = textID.text
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
