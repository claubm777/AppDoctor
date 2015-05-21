//
//  ShowFoodController.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/3/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import UIKit

class ShowFoodController: UIViewController {
    
    
    
    
    @IBOutlet weak var episodelab: UILabel!
    
    @IBOutlet weak var dateLab: UILabel!
    
    @IBOutlet weak var foodLabe1: UILabel!
    @IBOutlet weak var foodLabe2: UILabel!
    
    @IBOutlet weak var foodLabe3: UILabel!
    @IBOutlet weak var foodLabe4: UILabel!
    
    @IBOutlet weak var foodLabe5: UILabel!
    
    
    @IBOutlet weak var foodQuantit1: UILabel!
    
    @IBOutlet weak var foodQuantit2: UILabel!
    
    @IBOutlet weak var foodQuantit3: UILabel!
    
    @IBOutlet weak var foodQuantit4: UILabel!
    
    @IBOutlet weak var foodQuantit5: UILabel!
    
    
    var patient: Patient?
    var episode: Episode?
    
    var foodLabels: [UILabel] = []
    var foodQuantities: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodLabe1.text = ""
        foodLabe2.text = ""
        foodLabe3.text = ""
        foodLabe4.text = ""
        foodLabe5.text = ""
        
        foodLabels.append(foodLabe1)
        foodLabels.append(foodLabe2)
        foodLabels.append(foodLabe3)
        foodLabels.append(foodLabe4)
        foodLabels.append(foodLabe5)
        
        foodQuantit1.text = ""
        foodQuantit2.text = ""
        foodQuantit3.text = ""
        foodQuantit4.text = ""
        foodQuantit5.text = ""
        
        foodQuantities.append(foodQuantit1)
        foodQuantities.append(foodQuantit2)
        foodQuantities.append(foodQuantit3)
        foodQuantities.append(foodQuantit4)
        foodQuantities.append(foodQuantit5)
        
        if patient != nil {
            if episode != nil {
                
                let foods = episode!.foods
                dateLab.text = episode!.date
                
                for var index = 0; index < foods.count; index++ {
                    
                    if (index < 5)
                    {
                        let name = foodLabels[index]
                        let quantity = foodQuantities[index]
                        let food = foods[index]
                        
                        name.text = food.name
                        quantity.text = food.quantity.description
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
