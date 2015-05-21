//
//  PatientViewController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class PatientViewController: UIViewController {
    
    
    @IBOutlet weak var labelEpisodio1: UIButton!
    @IBOutlet weak var labelEpisodio2: UIButton!
    @IBOutlet weak var labelEpisodio3: UIButton!
    @IBOutlet weak var labelEpisodio4: UIButton!
    @IBOutlet weak var labelEpisodio5: UIButton!
    @IBOutlet weak var maillabel: UILabel!
    @IBOutlet weak var cedulalabel: UILabel!
    @IBOutlet weak var patientNameLabel: UILabel!
    var episodeButtons: [UIButton] = []
    
    var patient: Patient?
    
    var doctor: Doctor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        labelEpisodio1.setTitle("", forState: UIControlState.Normal)
        labelEpisodio2.setTitle("", forState: UIControlState.Normal)
        labelEpisodio3.setTitle("", forState: UIControlState.Normal)
        labelEpisodio4.setTitle("", forState: UIControlState.Normal)
        labelEpisodio5.setTitle("", forState: UIControlState.Normal)
        
        labelEpisodio1.enabled = false
        labelEpisodio2.enabled = false
        labelEpisodio3.enabled = false
        labelEpisodio4.enabled = false
        labelEpisodio5.enabled = false
        
        episodeButtons.append(labelEpisodio1)
        episodeButtons.append(labelEpisodio2)
        episodeButtons.append(labelEpisodio3)
        episodeButtons.append(labelEpisodio4)
        episodeButtons.append(labelEpisodio5)
        
        if patient != nil {
            println("miiiiiiiiiiiiiiiiii")
            println(patient!.episodes.count)
            patientNameLabel.text = patient!.name
            maillabel.text = patient!.mail
            cedulalabel.text = patient!.id
            
            let episodes = patient!.episodes
            var number = 0
            
            for var index = episodes.count-1; index >= 0; index-- {
                
                if (number < 5)
                {
                    let button = episodeButtons[number]
                    let episode = episodes[index]
                    
                    button.setTitle(episode.date, forState: UIControlState.Normal)
                    button.enabled = true
                    number++
                }
                else
                {
                    break
                }
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if patient != nil {
            if segue.identifier == "showEpisodeDetails" {
                
                let episodes = patient!.episodes
                
                let index: Int = sender!.tag
                let count = episodes.count
                
                let episode = episodes[count-index]
                
                
                let episodeDetailsViewController = segue.destinationViewController as! EpisodeDetailViewController
                episodeDetailsViewController.patient = patient
                episodeDetailsViewController.episode = episode
                
            }
                
            else if segue.identifier == "searchBetweenDates" {

                let searchViewController = segue.destinationViewController as! SearchController
                println(patient!)
                searchViewController.patient = patient!
                searchViewController.doctor = doctor!

            }
            
            
        }
        
    }
    
    
    @IBAction func SearchBDates(sender: AnyObject) {
        if patient != nil {
            performSegueWithIdentifier("searchBetweenDates", sender: sender)

        }
    }
    
    
    @IBAction func showEp(sender: AnyObject) {
        if patient != nil {
            performSegueWithIdentifier("showEpisodeDetails", sender: sender)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

