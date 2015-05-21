//
//  Doctor.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import Foundation

class Doctor {
    var name: String
    var id: String = ""
    var mail: String
    var discipline1: Int
    var discipline: String = "Medico General"
    var token:String = ""
    
    init (doctorDictionary: NSDictionary) {
        
        self.name = doctorDictionary["name"] as! String
        
        self.mail = doctorDictionary["email"] as! String
        
        self.discipline1 = doctorDictionary["discipline"] as! Int
        
        switch discipline{
        case _ where discipline1 == 0:
            discipline = "Anesthesia"
        case _ where discipline1 == 1:
            discipline = "Cardiovascular Disease"
        case _ where discipline1 == 2:
            discipline = "Dermatology"
        case _ where discipline1 == 3:
            discipline = "Emergency medicine"
        case _ where discipline1 == 4:
            discipline = "Endocrinology and metabolism"
        case _ where discipline1 == 5:
            discipline = "Family practice"
        case _ where discipline1 == 6:
            discipline = "Gastroenterology"
        case _ where discipline1 == 7:
            discipline = "General Practice"
        case _ where discipline1 == 8:
            discipline = "Geriatric Medicine"
        case _ where discipline1 == 9:
            discipline = "Gynecology"
        case _ where discipline1 == 10:
            discipline = "Gynecology Oncology"
        case _ where discipline1 == 11:
            discipline = "Hematology"
        case _ where discipline1 == 12:
            discipline = "Infectious Diseases"
        case _ where discipline1 == 13:
            discipline = "Internal Medicine"
        case _ where discipline1 == 14:
            discipline = "Neonatology"
        default:
            discipline = "Medico General"
        }
        
    }
    
    
}