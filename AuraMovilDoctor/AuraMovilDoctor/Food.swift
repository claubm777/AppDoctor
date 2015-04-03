//
//  Food.swift
//  AuraMovilDoctor
//
//  Created by Gerardo Motta on 4/2/15.
//  Copyright (c) 2015 aura. All rights reserved.
//

import Foundation
struct Food {
    
    var name: String
    var quantity: Int
    var episode: Episode?
    
    init(foodDictionary: NSDictionary, episode: Episode){
        self.name = foodDictionary["name"] as String
        self.quantity = foodDictionary["quantity"] as Int
        self.episode = episode
    }
    
    init (name: String, quantity: Int, episode: Episode)
    {
        self.name = name
        self.quantity = quantity
        self.episode = episode
    }
    
    func toDictionary() -> NSDictionary {
        
        let dictionary = NSDictionary(objects: [name, quantity], forKeys: ["name", "quantity"])
        return dictionary
    }
    
}