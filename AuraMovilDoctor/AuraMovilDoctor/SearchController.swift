//
//  SearchController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    
    
    @IBOutlet weak var firstDateLabe: UILabel!
    
    @IBOutlet weak var secondDateLabe: UILabel!
    
    @IBOutlet weak var datePi: UIDatePicker!
    
    var patient: Patient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        println("00000000000000000000000000000000000000000000004444")
        datePi.addTarget(self, action: Selector("firstDatePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func firstDatePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var strDate = dateFormatter.stringFromDate(datePi.date)
        
        //let toArray = strDate.componentsSeparatedByString("/")
        //let backToString = join("-", toArray)
        
        firstDateLabe.text = strDate
    }
    
    @IBAction func secDatePick(sender: AnyObject) {
        datePi.removeTarget(self, action: Selector("firstDatePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        secondDateLabe.text = firstDateLabe.text
        datePi.addTarget(self, action: Selector("secondDatePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    
    func secondDatePickerChanged(datePicker:UIDatePicker) {
        
        var dateFormatter = NSDateFormatter()
        
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var strDate = dateFormatter.stringFromDate(datePi.date)
        
        //let toArray = strDate.componentsSeparatedByString("/")
        //let backToString = join("-", toArray)
        
        secondDateLabe.text = strDate
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showResults" {
            
            let patientID = patient!.id
            let firstDate = firstDateLabe!.text
            let secondDate = secondDateLabe!.text
            
            let address = "https://aura-app.herokuapp.com/api/patient/\(patientID)/episode/\(firstDate!)/\(secondDate!)"
            
            let patientURL = NSURL(string: address)
            
            let dataObject = NSData(contentsOfURL: patientURL!)
            let episodesArray: NSArray = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as! NSArray
            
            println(episodesArray)
            
            var episodes: [Episode] = []
            
            for episode in episodesArray {
                let episodeRetrieved = episode as! NSDictionary
                let newEpisode = Episode(episodeDictionary: episodeRetrieved, patientId: patient!.id)
                episodes.append(newEpisode)
            }
            
            let resultsController = segue.destinationViewController as! ShowResultsController
            resultsController.episodes = episodes
            resultsController.patient = patient!
            
        }
    }
    
    @IBAction func busqueda(sender: AnyObject) {
        performSegueWithIdentifier("showResults", sender: sender)
    }
    
    
    
}
