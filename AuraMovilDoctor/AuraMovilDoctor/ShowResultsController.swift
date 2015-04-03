//
//  ShowResultsController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/3/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class ShowResultsController: UIViewController {

    @IBOutlet weak var buttonEpisod1: UIButton!
    
    @IBOutlet weak var buttonEpisod2: UIButton!
    @IBOutlet weak var buttonEpisod3: UIButton!
    @IBOutlet weak var buttonEpisod4: UIButton!
    
    @IBOutlet weak var buttonEpisod5: UIButton!
    @IBOutlet weak var buttonEpisod6: UIButton!
    @IBOutlet weak var buttonEpisod7: UIButton!
    @IBOutlet weak var buttonEpisod8: UIButton!
    @IBOutlet weak var buttonEpisod9: UIButton!
    @IBOutlet weak var buttonEpisod10: UIButton!
    
    
    
    var patient: Patient?
    var episodes: [Episode]?
    
    var episodeButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        buttonEpisod1.setTitle("", forState: UIControlState.Normal)
        buttonEpisod2.setTitle("", forState: UIControlState.Normal)
        buttonEpisod3.setTitle("", forState: UIControlState.Normal)
        buttonEpisod4.setTitle("", forState: UIControlState.Normal)
        buttonEpisod5.setTitle("", forState: UIControlState.Normal)
        buttonEpisod6.setTitle("", forState: UIControlState.Normal)
        buttonEpisod7.setTitle("", forState: UIControlState.Normal)
        buttonEpisod8.setTitle("", forState: UIControlState.Normal)
        buttonEpisod9.setTitle("", forState: UIControlState.Normal)
        buttonEpisod10.setTitle("", forState: UIControlState.Normal)
        
        buttonEpisod1.enabled = false
        buttonEpisod2.enabled = false
        buttonEpisod3.enabled = false
        buttonEpisod4.enabled = false
        buttonEpisod5.enabled = false
        buttonEpisod6.enabled = false
        buttonEpisod6.enabled = false
        buttonEpisod7.enabled = false
        buttonEpisod8.enabled = false
        buttonEpisod9.enabled = false
        buttonEpisod10.enabled = false
        
        episodeButtons.append(buttonEpisod1)
        episodeButtons.append(buttonEpisod2)
        episodeButtons.append(buttonEpisod3)
        episodeButtons.append(buttonEpisod4)
        episodeButtons.append(buttonEpisod5)
        episodeButtons.append(buttonEpisod6)
        episodeButtons.append(buttonEpisod7)
        episodeButtons.append(buttonEpisod8)
        episodeButtons.append(buttonEpisod9)
        episodeButtons.append(buttonEpisod10)
        
        if patient != nil {
            if episodes != nil {
                
                for var index = 0; index < episodes!.count; index++ {
                    
                    if (index < 10)
                    {
                        let button = episodeButtons[index]
                        let episode = episodes![index]
                        
                        button.setTitle(episode.date, forState: UIControlState.Normal)
                        button.enabled = true
                        
                    }
                    else
                    {
                        break
                    }
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func seeStatistics(sender: AnyObject) {
        if patient != nil {
            if episodes != nil {
                performSegueWithIdentifier("seeStatistics", sender: sender)
            }
        }
    }
   
    @IBAction func showDetailsEp(sender: AnyObject) {
        if patient != nil {
            if episodes != nil {
                performSegueWithIdentifier("showEpisodeDetails", sender: sender)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if patient != nil {
            if episodes != nil {
                if segue.identifier == "showEpisodeDetails" {
                    
                    let index: Int = sender!.tag - 1
                    
                    let episode = episodes![index]
                    
                    let episodeDetailsViewController = segue.destinationViewController as EpisodeDetailViewController
                    episodeDetailsViewController.patient = patient
                    episodeDetailsViewController.episode = episode
                    
                    
                }
                
                else if segue.identifier == "seeStatistics" {
                    
                    
                    
                    
                }
            }
        }
    }


}
