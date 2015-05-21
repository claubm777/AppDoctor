//
//  EpisodeDetailViewController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    var episode: Episode?
    var patient: Patient?
    
    
    @IBOutlet weak var stressLabe: UILabel!
    @IBOutlet weak var placeLabe: UILabel!
    @IBOutlet weak var sleepingCycleLabe: UILabel!
    @IBOutlet weak var timeSleptLabe: UILabel!
    @IBOutlet weak var strengthLabe: UILabel!
    @IBOutlet weak var dateLabe: UILabel!
    @IBOutlet weak var patientNameI: UILabel!
    @IBOutlet weak var patientNameLabe: UILabel!
    override func viewDidLoad() {
        
        if patient != nil {
            if episode != nil {
                
                patientNameLabe.text = patient!.name
                patientNameI.text = patient!.id
                
                //var dateFormatter = NSDateFormatter()
                //dateFormatter.dateFormat = "yyyy-MM-dd"
                //var strDate = dateFormatter.stringFromDate(episode!.date)
                dateLabe.text = episode!.date
                
                strengthLabe.text = episode!.strength.description
                timeSleptLabe.text = episode!.timeSlept.description
                sleepingCycleLabe.text = episode!.normalSleepingCycle.description
                placeLabe.text = episode!.place.description
                stressLabe.text = episode!.stress.description
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if patient != nil {
            if segue.identifier == "showSymptoms" {
                let symptomViewController = segue.destinationViewController as! ShowSymptomController
                symptomViewController.patient = patient
                symptomViewController.episode = episode
            }
            else if segue.identifier == "showSports" {
                let sportsViewController = segue.destinationViewController as! ShowSportsController
                sportsViewController.patient = patient
                sportsViewController.episode = episode
            }
            else if segue.identifier == "showFoods" {
                let foodsViewController = segue.destinationViewController as! ShowFoodController
                foodsViewController.patient = patient
                foodsViewController.episode = episode
            }
            else if segue.identifier == "showMedicines" {
                let medicinesViewController = segue.destinationViewController as! ShowMedicinesViewController
                medicinesViewController.patient = patient
                medicinesViewController.episode = episode
            }
        }
        
    }
    
    
    
    
    @IBAction func showSymp(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("showSymptoms", sender: sender)
            }
        }
    }
    
    
    @IBAction func showSp(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("showSports", sender: sender)
            }
        }
    }
    
    
    @IBAction func showF(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("showFoods", sender: sender)
            }
        }
    }
    
    @IBAction func showMed(sender: AnyObject) {
        if patient != nil {
            if episode != nil {
                performSegueWithIdentifier("showMedicines", sender: sender)
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
