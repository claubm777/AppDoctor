//
//  Symptom.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import Foundation

struct Symptom {
    
    var symptom: String
    var episode: Episode
    
    init(symptomDictionary: NSDictionary, episode: Episode){
        
        var symptom1 = symptomDictionary["symptom"] as! Int
        self.episode = episode
        
        let symptoms = ["", "Depression, irritability or excitement", "Lack of restful sleep", "Stuffy eyes or watery eyes", "Cravings",
            "Throbbing pain on one or both sides of the head", "Eye pain", "Neck pain", "Frequent urinaton", "Yawning", "Numbness or tingling",
            "Nausea or vomitting", "Light, noise or smells worsen pain"]

        
        self.symptom = symptoms[symptom1]
        
    }
    
    init (sym: Int, episode: Episode)
    {
        self.symptom = ""
        self.episode = episode
    }
    
    func toDictionary() -> NSDictionary {
        
        let dictionary = NSDictionary(objects: [symptom], forKeys: ["symptom"])
        return dictionary
    }
    
}