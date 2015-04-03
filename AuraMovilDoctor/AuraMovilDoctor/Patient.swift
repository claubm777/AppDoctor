//
//  Patient.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import Foundation

class Patient {
    
    var name: String
    var gender: Int
    var id: String = ""
    var mail: String
    var episodes: [Episode] = []
    
    init (patientDictionary: NSDictionary) {
        
        self.name = patientDictionary["name"] as String
        self.gender = patientDictionary["gender"] as Int
        
        self.mail = patientDictionary["email"] as String
        let episodesRetrieved: [NSDictionary] = patientDictionary["episodes"] as [NSDictionary]
        
        for episode in episodesRetrieved {
            let newEpisode = Episode(episodeDictionary: episode, patientId: id)
            episodes.append(newEpisode)
        }
        
        
    }
    
}