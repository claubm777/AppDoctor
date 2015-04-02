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
    
    init (doctorDictionary: NSDictionary) {
        println("dfdfdfdhhhhhhhooooooooo")
        self.name = doctorDictionary["name"] as String
        println("dfdffddd1111111")
        self.mail = doctorDictionary["email"] as String
        println("dfdffddd11111113333333")
        self.discipline1 = doctorDictionary["discipline"] as Int
        println(discipline1)
        
        switch discipline{
        case _ where discipline1 == 0:
        discipline = "Neurologo"
        case _ where discipline1 == 1:
        discipline = "Oftalmolofo"
        case _ where discipline1 == 2:
        discipline = "Pediatra"
        case _ where discipline1 == 3:
        discipline = "Ginecologo"
        case _ where discipline1 == 4:
        discipline = "Gastroenterologo"
        default:
        discipline = "Medico General"
        }
        
    }
    
    
}