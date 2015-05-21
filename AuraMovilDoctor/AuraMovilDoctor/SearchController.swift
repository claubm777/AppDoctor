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
    
    var doctor: Doctor?
    
    var episodes: [Episode]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib

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
            
            let resultsController = segue.destinationViewController as! ShowResultsController
            resultsController.episodes = episodes!
            resultsController.patient = patient!
        }
    }
    
    @IBAction func busqueda(sender: AnyObject) {
        
        var err: NSError?
        
        let firstDate = firstDateLabe!.text
        let secondDate = secondDateLabe!.text
        
        let baseURL = NSURL(string: "https://aura-app.herokuapp.com/api/patient/\(patient!.id)/episode/\(firstDate!)/\(secondDate!)")
        
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
            
            println("error \(httpResponse.statusCode)")
            
            let episodesArray: NSArray = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as! NSArray
            
            println(episodesArray)
            
            var episodesList: [Episode] = []
            
            for episode in episodesArray {
                let episodeRetrieved = episode as! NSDictionary
                let newEpisode = Episode(episodeDictionary: episodeRetrieved, patientId: patient!.id)
                episodesList.append(newEpisode)
            }
            
            self.episodes = episodesList
            
            performSegueWithIdentifier("showResults", sender: sender)
            
        }
        
        
    }
    
    
    
}
