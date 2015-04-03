//
//  ShowSportsController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/3/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class ShowSportsController: UIViewController {

    
    @IBOutlet weak var episodeLabe: UILabel!
    @IBOutlet weak var labelDescriptio1: UILabel!
    @IBOutlet weak var labelIntensit1: UILabel!
    @IBOutlet weak var labelPlac1: UILabel!
    @IBOutlet weak var labelClimat1: UILabel!
    @IBOutlet weak var labelClimat2: UILabel!
    @IBOutlet weak var labelHydratio1: UILabel!
    @IBOutlet weak var labelHydratio2: UILabel!
    
    @IBOutlet weak var labelDescriptio2: UILabel!
    
    @IBOutlet weak var labelIntensit2: UILabel!
    
    @IBOutlet weak var labelPlac2: UILabel!
    
    var patient: Patient?
    var episode: Episode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDescriptio1.text = ""
        labelIntensit1.text = ""
        labelPlac1.text = ""
        labelClimat1.text = ""
        labelHydratio1.text = ""
        
        labelDescriptio2.text = ""
        labelIntensit2.text = ""
        labelPlac2.text = ""
        labelClimat2.text = ""
        labelHydratio2.text = ""
        
        if patient != nil {
            if episode != nil {
                
                let sports = episode!.sports
                episodeLabe.text = episode!.date
                
                if (sports.count >= 2)
                {
                    let firstSport = sports[0]
                    
                    labelDescriptio1.text = "Description: \(firstSport.desc.description)"
                    labelIntensit1.text = "Intensity: \(firstSport.intensity.description)"
                    labelPlac1.text = "Place: \(firstSport.place.description)"
                    labelClimat1.text = "Climate: \(firstSport.climate.description)"
                    labelHydratio1.text = "Hydration: \(firstSport.hydration.description)"
                    
                    let secondSport = sports[1]
                    
                    labelDescriptio2.text = "Description: \(secondSport.desc.description)"
                    labelIntensit2.text = "Intensity: \(secondSport.intensity.description)"
                    labelPlac2.text = "Place: \(secondSport.place.description)"
                    labelClimat2.text = "Climate: \(secondSport.climate.description)"
                    labelHydratio2.text = "Hydration: \(secondSport.hydration.description)"
                }
                else if (sports.count == 1)
                {
                    let firstSport = sports[0]
                    
                    labelDescriptio1.text = firstSport.desc.description
                    labelIntensit1.text = firstSport.intensity.description
                    labelPlac1.text = firstSport.place.description
                    labelClimat1.text = firstSport.climate.description
                    labelHydratio1.text = firstSport.hydration.description
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
