//
//  ShowSymptomController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/3/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class ShowSymptomController: UIViewController {
    
    
    @IBOutlet weak var labelSympto1: UILabel!
    @IBOutlet weak var labelSympto2: UILabel!
    @IBOutlet weak var labelSympto3: UILabel!
    @IBOutlet weak var labelSympto4: UILabel!
    @IBOutlet weak var labelSympto5: UILabel!
    
    @IBOutlet weak var labelEpisod: UILabel!
    
    
    
    var patient: Patient?
    var episode: Episode?
    
    var symtomsLabel: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSympto1.text = ""
        labelSympto2.text = ""
        labelSympto3.text = ""
        labelSympto4.text = ""
        labelSympto5.text = ""
        
        symtomsLabel.append(labelSympto1)
        symtomsLabel.append(labelSympto2)
        symtomsLabel.append(labelSympto3)
        symtomsLabel.append(labelSympto4)
        symtomsLabel.append(labelSympto5)
        
        if patient != nil {
            if episode != nil {
                
                let symptoms = episode!.symptoms
                labelEpisod.text = episode!.date
                
                for var index = 0; index < symptoms.count; index++ {
                    
                    if (index < 5)
                    {
                        let label = symtomsLabel[index]
                        let symptom = symptoms[index]
                        
                        label.text = symptom.symptom.description
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
    
    
}
