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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
