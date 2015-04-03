//
//  ShowMedicinesViewController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/3/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class ShowMedicinesViewController: UIViewController {

  
    
    @IBOutlet weak var episodeLabe: UILabel!
    
    @IBOutlet weak var medicineLabe1: UILabel!
    @IBOutlet weak var medicineLabe2: UILabel!
    @IBOutlet weak var medicineLabe3: UILabel!
    @IBOutlet weak var medicineLabe4: UILabel!
    @IBOutlet weak var medicineLabe5: UILabel!
    
    
    @IBOutlet weak var medicineQuantit1: UILabel!
    @IBOutlet weak var medicineQuantit2: UILabel!
    @IBOutlet weak var medicineQuantit3: UILabel!
    @IBOutlet weak var medicineQuantit4: UILabel!
    @IBOutlet weak var medicineQuantit5: UILabel!
    
    
    var patient: Patient?
    var episode: Episode?
    
    var medicineNameLabels: [UILabel] = []
    var medicineQuantityLabels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        medicineLabe1.text = ""
        medicineLabe2.text = ""
        medicineLabe3.text = ""
        medicineLabe4.text = ""
        medicineLabe5.text = ""
        
        medicineNameLabels.append(medicineLabe1)
        medicineNameLabels.append(medicineLabe2)
        medicineNameLabels.append(medicineLabe3)
        medicineNameLabels.append(medicineLabe4)
        medicineNameLabels.append(medicineLabe5)
        
        medicineQuantit1.text = ""
        medicineQuantit2.text = ""
        medicineQuantit3.text = ""
        medicineQuantit4.text = ""
        medicineQuantit5.text = ""
        
        medicineQuantityLabels.append(medicineQuantit1)
        medicineQuantityLabels.append(medicineQuantit2)
        medicineQuantityLabels.append(medicineQuantit3)
        medicineQuantityLabels.append(medicineQuantit4)
        medicineQuantityLabels.append(medicineQuantit5)
        
        if patient != nil {
            if episode != nil {
                
                let medicines = episode!.medicines
                episodeLabe.text = episode!.date
                
                for var index = 0; index < medicines.count; index++ {
                    
                    if (index < 5)
                    {
                        let name = medicineNameLabels[index]
                        let quantity = medicineQuantityLabels[index]
                        let medicine = medicines[index]
                        
                        name.text = medicine.name
                        quantity.text = medicine.hoursAgo.description
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
