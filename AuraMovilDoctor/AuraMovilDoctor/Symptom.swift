//
//  Symptom.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import Foundation

struct Symptom {
    
    var symptom: Int
    var episode: Episode
    
    init(symptomDictionary: NSDictionary, episode: Episode){
        self.symptom = symptomDictionary["symptom"] as Int
        self.episode = episode
    }
    
    init (symptom: Int, episode: Episode)
    {
        self.symptom = symptom
        self.episode = episode
    }
    
    func toDictionary() -> NSDictionary {
        
        let dictionary = NSDictionary(objects: [symptom], forKeys: ["symptom"])
        return dictionary
    }
    
}